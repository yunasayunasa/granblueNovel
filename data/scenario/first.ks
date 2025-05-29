*start

[title name="演算世界とチヨコレイト"]

; ----- 免責事項など -----
; (もし免責事項を最初に表示したい場合は、ここに記述)
; (例: [text text="本作はスマホでのプレイを想定しています。改行もそのまま表示されます。\nPCやタブレット等では～" x=100 y=200 size=20])
; [l]
; [cm] // 画面クリア

; ----- プロローグ開始 -----

; 背景表示 (data/bgimage/calc_space.jpg を使用する例)
[bg storage="calc_space.jpg" time="1000"]

君は、見たこともない空間にいる。ノイズのような歪みが空間に走り、とても現実とは思えない。[l]

; キャラクター定義 (ファイル冒頭や別のシステムファイルで行うことも可能)
; [chara_new name="unknown_oracle" jname="？？？"] ; 立ち絵なしの場合、jnameで名前表示のみ
[chara_new name="roger" storage="roger_normal.png" jname="ロジャー"] ; data/fgimage/roger_normal.png
[chara_new name="silhouette" storage="silhouette.png" jname="？？？"] ; data/fgimage/silhouette.png

; オロロジャイアちゃんのセリフ (立ち絵なし、名前表示のみの例)
#？？？
おはよう！お呼びとあらば即参上できない！今日も今日とて限界勤務上等のオロロジャイアちゃんでっす！[l]

; ロジャー登場
[chara_show name="roger" time="500" wait="true"]

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

; シルエット登場
[chara_show name="silhouette" time="500" wait="true"]

#？？？
それじゃあ、団長ちゃん、一緒に行こっか♪[l]

仲間になったのは...[l]

; 選択肢
[link target="*narumia_route_start" size="24" x="400" y="300"]ナルメア[endlink][r]
[button name="narumia_description" graphic="button/description_button.png" x="600" y="300" target="*show_narumia_desc"] ; 説明ボタン (任意)
; (イージーモード。３つのエンディングが存在します。まずはここから始めることをお勧めします) <- 説明は別ウィンドウやツールチップで出すのが一般的

[link target="*siete_route_start" size="24" x="400" y="350"]シエテ[endlink][r]
; (ノーマルモード。6つのエンディングが存在します。標準的な難易度です)

[link target="*hard_mode_start" size="24" x="400" y="400"]誰も仲間にしない[endlink]
; (ハードモード。エンディングは１つです。選択肢が増加し、BADENDはタイトルからやり直しです)
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