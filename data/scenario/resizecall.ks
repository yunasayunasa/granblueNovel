; resizecall.ks

[iscript]
// 縦横どちらが長いか判定 (この $.getLargeScreenWidth() がTyranoScript標準か要確認。
// もしなければ、 window.innerWidth と window.innerHeight を比較するなどで自作)
// tf.larger_width = (window.innerWidth > window.innerHeight); // trueなら横長、falseなら縦長
// より確実なのは、Config.tjsのscWidthとscHeightの比率と、実際の画面比率を比較すること
var sc_width = parseInt(TYRANO.kag.config.scWidth);
var sc_height = parseInt(TYRANO.kag.config.scHeight);
tf.is_landscape = (window.innerWidth / window.innerHeight) > (sc_width / sc_height + 0.1); // 多少の誤差を許容
// または単純に現在の画面の縦横を比較
// tf.is_landscape = (window.innerWidth > window.innerHeight);
[endscript]

[iscript]
// 現在表示されているキャラクター名を取得しておく（メッセージウィンドウ再構成のため）
tf.chara_name_str = $(".chara_name_area").text();
[endscript]

; 縦持ちの場合 (または is_landscape が false の場合)
[if exp="tf.is_landscape == false"]
    [body scWidth=450 scHeight=800] 

    ; メッセージウィンドウ設定 (あなたの現在の設定に近い値)
    [position layer="message0" left="25" top="600" width="400" height="180" page=fore visible=true]
    [position layer="message0" page=fore margint="25" marginl="25" marginr="25" marginb="25"]

    ; 名前表示欄 (あなたの現在の設定に近い値)
    [free layer="message0" name="chara_name_area"] 
    [ptext name="chara_name_area" text="&tf.chara_name_str" layer="message0" color="white" size="20" bold="true" x="40" y="605"]
    [chara_config ptext="chara_name_area"] 

    [iscript]
    // 各要素のサイズや位置をゲーム変数に設定
    // キャラクター (例: ロジャーを画面中央やや上に)
    f.roger_x = Math.round(450 * 0.5 - 150); // (画面幅/2 - キャラ幅/2) のような計算 (キャラ幅300と仮定)
    f.roger_y = Math.round(800 * 0.2);    // 画面高さの上から20%
    f.roger_width = 300; // キャラクターの表示幅 (任意)
    f.roger_height = 600; // キャラクターの表示高さ (任意、または auto)

    // 選択肢ボタンの共通設定 (あなたの基準)
    f.glink_x = 70;
    f.glink_y_start = 250;
    f.glink_y_step = 70; // ボタン間のY座標の間隔
    f.glink_width = 200;
    f.glink_size = 28;
    f.glink_color = "blue";

    f.font_size = 20; // メッセージテキストのフォントサイズ
    [endscript]

[else]
    ; 横持ちの場合 (今回は簡易的に設定、または縦持ちと同じにする)
    [body scWidth=800 scHeight=450]

    ; メッセージウィンドウ設定 (横持ち用)
    [position layer="message0" left="50" top="300" width="700" height="130" page=fore visible=true]
    [position layer="message0" page=fore margint="20" marginl="20" marginr="20" marginb="20"]

    ; 名前表示欄 (横持ち用)
    [free layer="message0" name="chara_name_area"]
    [ptext name="chara_name_area" text="&tf.chara_name_str" layer="message0" color="white" size="20" bold="true" x="40" y="605"]
    [chara_config ptext="chara_name_area"]

    [iscript]
    // 横持ち時の各要素のサイズや位置
    f.roger_x = Math.round(800 * 0.5 - 150);
    f.roger_y = Math.round(450 * 0.1);
    f.roger_width = 250;
    f.roger_height = 500;

    f.glink_x = 200;
    f.glink_y_start = 100;
    f.glink_y_step = 60;
    f.glink_width = 400;
    f.glink_size = 24;
    f.glink_color = "green"; // 色を変えてみるなど

    f.font_size = 22;
    [endscript]
[endif]

; ----- 共通の要素再配置処理 -----
; 現在表示されているキャラクターの位置を更新 (例: ロジャー)
[chara_move name="roger" x="&f.roger_x" y="&f.roger_y" width="&f.roger_width" height="&f.roger_height" time="0"]
; (他の表示されている可能性のあるキャラクターも同様に [chara_move] で位置を更新)

; 選択肢ボタンの位置を更新 (glink の name 属性で指定しておく必要がある)
; もしglinkにname属性をつけていない場合は、この方法は使えない。
; その場合は、選択肢を表示する直前にこれらのf変数を参照して [glink] を記述する。
; [anim name="glink_narumia" left="&f.glink_x" top="&f.glink_y_start" width="&f.glink_width" time="0"]
; [anim name="glink_siete"   left="&f.glink_x" top="&f.glink_y_start + f.glink_y_step" width="&f.glink_width" time="0"]
; [anim name="glink_noone"   left="&f.glink_x" top="&f.glink_y_start + f.glink_y_step*2" width="&f.glink_width" time="0"]

; メッセージテキストのフォントサイズを更新
[iscript]
$(".message_inner").find("p").css("font-size", f.font_size + "px");
// または $(".message_inner p span").css("font-size", f.font_size + "px"); のように、より具体的に指定
[endscript]
; [deffont size="&f.font_size"] ; デフォルトフォントサイズも変更
; [resetfont] ; これを実行すると、deffontで設定したサイズになる

; 画面更新を促すために短いウェイトを入れると安定することがある
[wait time=100]

[return]