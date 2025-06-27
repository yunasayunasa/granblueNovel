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
    [iscript]
    if (tf.is_debate_active === true) {
        if (tf.debate_loop_timer) clearTimeout(tf.debate_loop_timer);
        var current_statement = tf.debate_statements[tf.debate_index];
        f.current_text = current_statement.text;
        f.is_weakpoint = current_statement.is_weakpoint;
        tf.debate_index = (tf.debate_index + 1) % tf.debate_statements.length;
    }
    [endscript]

    ; ★ 修正点1: クリアしてから表示
    [ptext name="debate_text" layer="0" x="50" y="300" width="350" height="100" text="" size="28"] 
    [ptext name="debate_text" layer="0" x="50" y="300" width="350" height="100" size="28" color="white" text="&f.current_text"] 

    [eval exp="tyrano.plugin.kag.layer.getLayer('0', 'fore').find('.ptext[name=debate_text]').data('is_weakpoint', f.is_weakpoint)"]

    [iscript]
    tf.debate_loop_timer = setTimeout(function(){
        TYRANO.kag.ftag.startTag("jump", {target: "*debate_loop"});
    }, 2000);
    [endscript]
    [s]

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
    ; ★★★ 失敗時の演出 ★★★
    [free name="shoot_button" layer="fix"] ; ボタンを消す (このタグが有効か確認)

    ; ★★★ 必須パラメータを追加してテキストエリアをクリア ★★★
    [ptext name="debate_text" layer="0" x="50" y="300" text=""] ; x, y, layer を指定

    @layopt layer=message0 visible=true
    #
    くっ…タイミングが違ったか…[p]
    議論をやり直そう。[l]
    [jump target="*start_debate"]