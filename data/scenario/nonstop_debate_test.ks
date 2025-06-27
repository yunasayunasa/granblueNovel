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
[button name="shoot_button" graphic="nni.png" x="150" y="650" target="*shoot_action" clickse=""]

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

        // 現在の発言を取得
        var current_statement = tf.debate_statements[tf.debate_index];
        var text_to_show = current_statement.text;
        var is_weakpoint_flag = current_statement.is_weakpoint;

        // ★★★ jQueryでptextエリアを特定し、内容を書き換える ★★★
        // TyranoScriptがptextで生成するHTML要素のセレクタを特定する必要がある
        // 一般的には、ptext要素は `.ptext` クラスと `name` 属性を持つ
        // その中に実際に文字が表示される `.inner_ptext` のような要素がある
        var ptext_area_inner = $(".ptext[name='debate_text'] .inner_ptext");

        if (ptext_area_inner.length > 0) {
            // .html() で内容を完全に上書きする
            ptext_area_inner.html(text_to_show);

            // .data() で弱点フラグを親要素に保存する
            ptext_area_inner.parent().data("is_weakpoint", is_weakpoint_flag);

        } else {
            // もしセレクタで見つからない場合、コンソールに警告を出す
            console.warn("ptextエリアのセレクタ '.ptext[name=debate_text] .inner_ptext' が見つかりません。");
        }


        // 次の発言のインデックスを計算
        tf.debate_index = (tf.debate_index + 1) % tf.debate_statements.length;

        // 2秒後に再度このループを呼び出すタイマーをセット
        tf.debate_loop_timer = setTimeout(function(){
            TYRANO.kag.ftag.startTag("jump", {target: "*debate_loop"});
        }, 2000);
    }
    [endscript]
    ; [ptext]タグは削除し、[eval]も不要

    [s] ; iscript内のjumpが実行されるまで待つ

*shoot_action
    ; ★★★ 「撃つ！」ボタンが押された時の処理 ★★★
    [iscript]
    // 議論がアクティブな場合のみ処理を実行するように変更
    if (tf.is_debate_active === true) {
        // 議論を停止
        tf.is_debate_active = false;
        clearTimeout(tf.debate_loop_timer);

        // 発言エリアが弱点を表示していたかチェック
        var ptext_area = $(".ptext[name='debate_text']");
        var was_weakpoint = ptext_area.data("is_weakpoint");

        if (was_weakpoint === true) {
            // 正解！
            TYRANO.kag.ftag.startTag("jump", {target: "*debate_success"});
        } else {
            // 不正解
            TYRANO.kag.ftag.startTag("jump", {target: "*debate_fail"});
        }
    } // if (tf.is_debate_active) の閉じカッコ
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

    ; ★★★ iscriptでテキストエリアを空にする ★★★
    [iscript]
    $(".ptext[name='debate_text'] .inner_ptext").html("");
    [endscript]

    @layopt layer=message0 visible=true
    #
    くっ…タイミングが違ったか…[p]
    議論をやり直そう。[l]
    [jump target="*start_debate"]