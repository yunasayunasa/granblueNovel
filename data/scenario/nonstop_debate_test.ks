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

; 「撃つ！」ボタンを配置
; name属性を付けておくことで、後から非表示にしたりできる
[button name="shoot_button" graphic="shoot_button.png" x="150" y="650" target="*shoot_action" clickse=""]

; 発言表示用のテキストエリアをptextで作成
[ptext name="debate_text" layer="0" x="50" y="300" width="350" size="28" color="white"]
; 議論開始の合図
[eval exp="tf.is_debate_active = true"]
; 議論ループの開始
[jump target="*debate_loop"]
[s] 

*debate_loop
    ; ★★★ 発言を順番に表示するループ ★★★
    [iscript]
    // 議論がアクティブでなければループを止める
    if (!tf.is_debate_active) {
        // タイマーを止めて何もしない
        if (tf.debate_loop_timer) {
            clearTimeout(tf.debate_loop_timer);
        }
        // このままだとスクリプトがここで止まるので、次のラベルにジャンプするなどの処理が必要
        // TYRANO.kag.ftag.startTag("jump", {target: "*debate_end"});
        return;
    }

    // 現在の発言を取得
    var current_statement = tf.debate_statements[tf.debate_index];
    // jQueryを使ってptextエリアにテキストを表示
    // .tyrano_ptext[data-name='debate_text'] のようにセレクタを特定する必要がある場合も
    var ptext_area = $(".ptext[name='debate_text']");
    if (ptext_area.length > 0) {
        ptext_area.find(".inner_ptext").html(current_statement.text);
        // 弱点かどうかをHTML要素のデータ属性に保存しておく
        ptext_area.data("is_weakpoint", current_statement.is_weakpoint);
    }

    // 次の発言のインデックスを計算 (最後まで行ったら0に戻る)
    tf.debate_index = (tf.debate_index + 1) % tf.debate_statements.length;

    // 2秒後(2000ミリ秒)に、再度このループを呼び出すタイマーをセット
    tf.debate_loop_timer = setTimeout(function(){
        TYRANO.kag.ftag.startTag("jump", {target: "*debate_loop"});
    }, 2000);
    [endscript]
    ; iscript内でjumpするので、ここには[s]は置かない
    [s] ; ただし、次のjumpが実行されるまでスクリプトを止めるために必要

*shoot_action
    ; ★★★ 「撃つ！」ボタンが押された時の処理 ★★★
    [iscript]
    // 議論がアクティブでなければ何もしない
    if (!tf.is_debate_active) {
        return;
    }
    // 議論を一旦停止
    tf.is_debate_active = false;
    clearTimeout(tf.debate_loop_timer); 

    // 発言エリアが弱点を表示していたかチェック
    var ptext_area = $(".ptext[name='debate_text']");
    var was_weakpoint = ptext_area.data("is_weakpoint");

    // ここでは弾丸は固定なので、弱点を撃てたかどうかだけで判定
    if (was_weakpoint === true) {
        // 正解！
        TYRANO.kag.ftag.startTag("jump", {target: "*debate_success"});
    } else {
        // 不正解
        TYRANO.kag.ftag.startTag("jump", {target: "*debate_fail"});
    }
    [endscript]
    [s]

*debate_success
    ; ★★★ 成功時の演出 ★★★
    [cm]
    [clearfix]
    @layopt layer=message0 visible=true
    [bg storage="cafe_bg.jpg" time="100"] 

    ; 「論破！」などの演出
    [quake time="300" count="3"]
    [font size="50" color="red" bold="true"]
    論破！[p]
    [resetfont]

    # ; 名前クリア
    やった！矛盾を突き崩した！[l]
    [jump storage="first.ks" target="*start"]

*debate_fail
    ; ★★★ 失敗時の演出 ★★★
    ; [playse storage="fail_se.wav"]
    ; 「撃つ！」ボタンと発言エリアを消す
    [free name="shoot_button" layer="fix"] 
    [free_ptext name="debate_text" layer="0"]

    @layopt layer=message0 visible=true
    # ; 名前クリア
    くっ…タイミングが違ったか…[l]
    ; ここから議論を再開するか、ペナルティを受けて別の展開に進むか
    ; 今回はシンプルに議論再開
    [jump target="*start_debate"]