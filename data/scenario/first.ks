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
; 背景表示 (data/bgimage/calc_space.jpg を使用する例)
[bg storage="calc_space.jpg" time="1000"]

; ★★★ キャラクター定義はここで行うか、専用の system.ks などで最初に読み込む ★★★
[chara_new name="roger" storage="roger_normal.png" jname="ロジャー"]
; [chara_new name="unknown_oracle" jname="？？？"] ; 立ち絵なしの場合

君は、見たこともない空間にいる。ノイズのような歪みが空間に走り、とても現実とは思えない。[l]


; ロジャー登場
[chara_show name="roger" time="500" wait="true"]

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

仲間になったのは...[l]

[button name="narumia_select_button"
        role="select"
        graphic="my_button_normal.png" ; ← fgimageフォルダ内のbuttonフォルダを指定
        
       
        x="150"                        ; ボタンの左端のX座標 (仮)
        y="450"                        ; ボタンの上端のY座標 (仮)
        width="420"                    ; ボタンの幅 (仮、画像の幅に合わせるか、指定したい幅)
        height="80"                    ; ボタンの高さ (仮、画像の高さに合わせるか、指定したい高さ)
        text="ナルメア"                 ; ボタンの上に表示するテキスト
        size="28"                      ; テキストのフォントサイズ (仮)
        font_color="0xffffff"          ; テキストの色 (例: 白, 0xRRGGBB形式)
        target="*narumia_route_start"]   ; クリック時のジャンプ先ラベル

[button name="siete_select_button"
        role="select"
        graphic="button/my_button_normal.png"
        enterimg="button/my_button_hover.png"
        clickimg="button/my_button_clicked.png"
        x="150"
        y="550" ; 前のボタンより下に配置
        width="420"
        height="80"
        text="シエテ"
        size="28"
        font_color="0xffffff"
        target="*siete_route_start"]

[button name="no_one_select_button"
        role="select"
        graphic="button/my_button_normal.png"
        enterimg="button/my_button_hover.png"
        clickimg="button/my_button_clicked.png"
        x="150"
        y="650" ; さらに下に配置
        width="420"
        height="80"
        text="誰も仲間にしない"
        size="28"
        font_color="0xffffff"
        target="*hard_mode_start"]

[s] ; 選択肢の入力待ち

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