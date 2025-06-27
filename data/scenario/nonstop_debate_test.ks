; nonstop_debate_test.ks

*start_debate

; ----- 初期設定 -----
[cm]
[clearfix]
[bg storage="cafe_bg.jpg" time="500"]

; メッセージウィンドウは一旦非表示に
@layopt layer=message0 visible=false

; キャラクター定義と表示
[chara_new name="roger" storage="roger_normal.png" jname="ロジャー"]
[chara_show name="roger" x="150" y="100"]

; ★★★ 議論用の変数を初期化 ★★★
[iscript]
// 相手の発言リスト
tf.debate_statements = [
    { text: "犯行は夜中に行われた…", is_weakpoint: false },
    { text: "その時、私はずっと寝ていた…", is_weakpoint: false },
    { text: "だから私には完璧なアリバイがある！", is_weakpoint: true }, 
    { text: "異論はないはずだ…", is_weakpoint: false }
];

// 反論の弾丸 (今回は固定)
tf.bullet_id = "witness_testimony";

// 議論の状態管理用変数
tf.debate_index = 0; 
// 現在表示中の発言のインデックス
tf.debate_loop_timer = null; 
// ループ処理のタイマーID
tf.is_debate_active = false; 
// 議論がアクティブか
[endscript]

; ----- 議論開始 -----
[button name="shoot_button" graphic="tyrano/images/system/arrow_down.png" x="150" y="650" target="*shoot_action" clickse=""]

; 発言表示用のテキストエリアをptextで作成
    [ptext name="debate_text" layer="0" x="50" y="300" width="350" height="100" size="28" color="white" border="line" border_color="red" border_size="2"]
; ★★★ height, frame, borderを追加 ★★★
[eval exp="tf.is_debate_active = true"]
[jump target="*debate_loop"]
[s]

*debate_loop
    ; ★★★ iscript内でテキストのセットまで完結させる ★★★
   [iscript]
    if (tf.is_debate_active === true) {
        if (tf.debate_loop_timer) clearTimeout(tf.debate_loop_timer);

        var current_statement = tf.debate_statements[tf.debate_index];
        var text_to_show = current_statement.text;
        var is_weakpoint_flag = current_statement.is_weakpoint;

        // ★★★ 正しいセレクタに変更 ★★★
        var p_element = $("p.debate_text");

        if (p_element.length > 0) {
            // .html() で内容を完全に上書きする
            p_element.html(text_to_show);

            // .data() で弱点フラグを保存する
            p_element.data("is_weakpoint", is_weakpoint_flag);

        } else {
            console.warn("p要素(class=debate_text)が見つかりません。");
        }

        tf.debate_index = (tf.debate_index + 1) % tf.debate_statements.length;

        tf.debate_loop_timer = setTimeout(function(){
            TYRANO.kag.ftag.startTag("jump", {target: "*debate_loop"});
        }, 2000);
    }
    [endscript]

    [s] ; iscript内のjumpが実行されるまで待つ

*shoot_action
    ; ★★★ 「撃つ！」ボタンが押された時の処理 (修正版) ★★★
    [iscript]
    if (tf.is_debate_active === true) {
        // 議論を停止
        tf.is_debate_active = false;
        clearTimeout(tf.debate_loop_timer);

        // ★★★ ボタンが押された時に「表示されていたはず」の発言を特定 ★★★
        // tf.debate_index は「次に表示する」インデックスを指しているので、
        // その一つ前が、ボタンを押した時に表示されていた発言になります。
        var displayed_index = tf.debate_index - 1;

        // もしインデックスが0の時にボタンが押された場合、-1になるので、
        // リストの最後のインデックスに戻す
        if (displayed_index < 0) {
            displayed_index = tf.debate_statements.length - 1;
        }

        // console.log("表示されていたはずのインデックス:", displayed_index); // デバッグ用

        // その発言が弱点だったか、元の配列から直接参照して判定する
        var was_weakpoint = tf.debate_statements[displayed_index].is_weakpoint;

        // console.log("その発言は弱点か？:", was_weakpoint); // デバッグ用

        if (was_weakpoint === true) {
            // 正解！
            TYRANO.kag.ftag.startTag("jump", {target: "*debate_success"});
        } else {
            // 不正解
            TYRANO.kag.ftag.startTag("jump", {target: "*debate_fail"});
        }
    }
    [endscript]
    [s]

*debate_success
    ; ★★★ 成功時の演出 ★★★
    [cm]
    [clearfix]
    @layopt layer=message0 visible=true
    [bg storage="courtroom_break.jpg" time="100"]

    [quake time="300" count="3"]
    [font size="50" color="red" bold="true"]
    論破！[p]
    [resetfont]

    # ; 名前クリア
    やった！矛盾を突き崩した！[l]
    [jump storage="first.ks" target="*start"]

 *debate_fail
    [free name="shoot_button" layer="fix"]

    ; ★★★ iscriptでテキストエリアを空にする (正しいセレクタで) ★★★
    [iscript]
    $("p.debate_text").html("");
    [endscript]

    @layopt layer=message0 visible=true
    #
    くっ…タイミングが違ったか…[p]
    議論をやり直そう。[l]
    [jump target="*start_debate"]