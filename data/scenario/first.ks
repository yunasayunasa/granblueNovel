*start
[iscript]
var tyrano_base_element = document.getElementById('tyrano_base');
if (tyrano_base_element) {
    tyrano_base_element.style.setProperty('transform', 'scale(1)', 'important');
    tyrano_base_element.style.setProperty('transform-origin', '0px 0px', 'important');
    // 必要であれば width, height, left, top もここで設定
    // tyrano_base_element.style.setProperty('width', '450px', 'important');
    // tyrano_base_element.style.setProperty('height', '800px', 'important');
    // tyrano_base_element.style.setProperty('left', '0px', 'important');
    // tyrano_base_element.style.setProperty('top', '0px', 'important');
    console.log("#tyrano_base の transform を script で scale(1) に設定試行");
} else {
    console.error("#tyrano_base が見つかりません");
}
[endscript]

[title name="演算世界とチヨコレイト"]
[bg storage="calc_space.jpg" time="1000"]

; メッセージウィンドウの位置とサイズを指定 (縦画面 720x1280 を想定した例)
[position layer="message0" left="30" top="980" width="660" height="250" page=fore visible=true]
; 文字が表示される実際の領域を内側に設定 (パディングのようなもの)
[position layer="message0" page=fore margint="30" marginl="30" marginr="30" marginb="30"]

; キャラクター名表示エリアの設定 (メッセージウィンドウ内の上部に配置する例)
[ptext name="chara_name_area" layer="message0" color="white" size="28" bold="true" x="50" y="1000"] ; y座標は上記 top + margint より少し下
[chara_config ptext="chara_name_area"]

; ★★★ キャラクター定義はここで行うか、専用の system.ks などで最初に読み込む ★★★
[chara_new name="roger" storage="roger_normal.png" jname="ロジャー"]
; [chara_new name="unknown_oracle" jname="？？？"] ; 立ち絵なしの場合

君は、見たこともない空間にいる。ノイズのような歪みが空間に走り、とても現実とは思えない。[l]


; ロジャー登場
[chara_show name="roger"　]
; (width, height 属性も指定している場合は、それも考慮)
[iscript]
var kag_obj = TYRANO.kag;

if (kag_obj) {
    console.log("--- TyranoScript Debug Log ---");

    var chara_roger = kag_obj.stat.charas["roger"];
    if (chara_roger) {
        console.log("キャラクター'roger'の情報:", chara_roger);
        // chara_roger の width と height が空なので、[chara_show] で指定するかCSSで制御する必要がありそう
    } else {
        console.error("キャラクター'roger'の定義が見つかりません！");
    }

    // map_layer_fore から前景レイヤー0の情報を取得
    if (kag_obj.layer && kag_obj.layer.map_layer_fore && kag_obj.layer.map_layer_fore["0"]) {
        var fore_layer_0_obj = kag_obj.layer.map_layer_fore["0"];
        console.log("前景レイヤー0 (map_layer_fore['0']):", fore_layer_0_obj);

        if (fore_layer_0_obj.canvas) {
            console.log("  前景レイヤー0のjQuery要素:", fore_layer_0_obj.canvas);
            console.log("  前景レイヤー0の表示状態 (visible):", fore_layer_0_obj.visible);

            // 前景レイヤー0の中に 'roger' らしき要素を探す
            if (window.jQuery) {
                var roger_element_container = fore_layer_0_obj.canvas.find('.tyrano_chara[data-name="roger"], figure[data-name="roger"]'); // TyranoV5/V6では .tyrano_chara の中に img があることが多い
                if (roger_element_container.length > 0) {
                    var roger_img = roger_element_container.find('img'); // img要素を取得
                    console.log("  前景レイヤー0内で'roger'のコンテナ要素を発見:", roger_element_container);
                    if(roger_img.length > 0){
                        console.log("    その中のimg要素:", roger_img);
                        console.log("      imgの幅(width):", roger_img.width());
                        console.log("      imgの高さ(height):", roger_img.height());
                        console.log("      imgのCSS(display):", roger_img.css('display'));
                        console.log("      imgのCSS(opacity):", roger_img.css('opacity'));
                        console.log("      imgのCSS(max-height):", roger_img.css('max-height')); // CSSで設定した値を確認
                        console.log("      imgのsrc:", roger_img.attr('src'));
                    } else {
                        console.warn("    'roger'のコンテナ内にimg要素が見つかりません。");
                    }
                } else {
                    console.warn("  前景レイヤー0内に'roger'のコンテナ要素が見つかりません。");
                }
            }
        } else {
            console.warn("  前景レイヤー0に canvas (jQuery要素) がありません。");
        }
    } else {
        console.warn("map_layer_fore から前景レイヤー0の情報が取得できませんでした。");
    }
    console.log("--- Debug Log End ---");
} else {
    console.error("TYRANO.kag オブジェクトが見つかりません！");
}
[endscript]
[l]

; オロロジャイアちゃんのセリフ (立ち絵なし、名前表示のみの例)
#ロジャー
おはよう！お呼びとあらば即参上できない！今日も今日とて限界勤務上等のオロロジャイアちゃんでっす！[l]


#ロジャー
ｵﾎﾝｴﾍﾝ...!ここは演算世界。僕の力で作り出された世界。あらゆる可能性を探るための場所さ。[l]
これから君には僕と一緒に旅をしてもらいたいんだ。[p]
そう！君がチョコをもらえる世界を探り出す為に！[l]
そんな訳で早速行ってみよう〜！と言っても...僕は一緒に行ける訳ではないんだけどね！社畜の悲しみ！[p]
代わりにガチャ回させてあげるから許して！[p]
はい！10連ガチャガチャっとね！[l]

; ロジャー退場
[chara_hide name="roger" time="500" wait="true"]

; ガチャ演出 (今は省略、SEや簡単なアニメーションを入れることも可能)

1人の仲間が目の前に現れる。[l]



#？？？
それじゃあ、団長ちゃん、一緒に行こっか♪[l]

; first.ks の選択肢部分 (glinkバージョン)

; ... (前の行まで) ...
仲間になったのは...[l]

; 選択肢 (glinkを使用)
; x, y, width, size は縦画面のレイアウトに合わせて調整してください
[glink color="blue" x="150" y="450" width="420" size="28" text="ナルメア" target="*narumia_route_start"]
[glink color="blue" x="150" y="550" width="420" size="28" text="シエテ" target="*siete_route_start"]
[glink color="blue" x="150" y="650" width="420" size="28" text="誰も仲間にしない" target="*hard_mode_start"]
[s]


; ----- 各ルートへの分岐先ラベル (これらは別の .ks ファイルに分けても良い) -----
*narumia_route_start
  ; ナルメアが仲間になる処理
  [chara_hide name="silhouette" time="100" wait="true"]
  [chara_new name="narumia" storage="narumia_normal.png" jname="ナルメア"] ; data/fgimage/narumia_normal.png
  [chara_show name="narumia" time="500" wait="true"]
  #ナルメア
  よろしくね、団長ちゃん！
  [jump storage="narumia_scenario.ks" target="*cafe_scene"] // ナルメア編のシナリオファイルへジャンプ (例)

*siete_route_start
  ; シエテが仲間になる処理
  ; ... (同様に)
  [jump storage="siete_scenario.ks" target="*deck_scene"]

*hard_mode_start
  ; 誰も仲間にしない処理
  ; ...
  [jump storage="hard_scenario.ks" target="*auguste_scene"]


; ----- 説明表示用ラベル (任意) -----
*show_narumia_desc
  [mtext text="【ナルメア】\nイージーモード。３つのエンディングが存在します。\nまずはここから始めることをお勧めします" size="20" x="300" y="200" time="500"]
  [wait time=3000] // 3秒待つ
  [mtext_hide time="500"]
  [jump target="*start"] // 選択肢に戻る (または元の場所を記憶して戻る)


; このファイルはここで終わり (各ルートは別ファイルにジャンプする想定)
; もし同じファイルに続けるなら @endjump は不要