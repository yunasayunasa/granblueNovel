*start
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
[chara_show name="roger" x="200" y="600" time="500" wait="true"]
; (width, height 属性も指定している場合は、それも考慮)

[iscript]
alert("キャラクター表示の直後です。開発者ツールでHTMLを確認してください。");
console.log(TYRANO.kag.layer.getLayer("fore", "0")); // 前景レイヤ0の情報をコンソールに出力 (前景レイヤの構造による)
[endscript]
[l] ; 処理を一時停止

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