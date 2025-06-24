; hard_scenario.ks
; ----- ハードモード登場キャラクター定義 -----

[chara_new name="ruria" storage="ruria_normal.png" jname="ルリア"]
; ルリアの表情差分などあれば、ここに [chara_face] で追加

[chara_new name="lowain" storage="lowain_normal.png" jname="ローアイン"]
; ローアインの仲間たち（エルセム、トモイ）も個別に立ち絵があるなら、同様に定義
[chara_new name="erusemu" storage="erusemu_normal.png" jname="エルセム"]
[chara_new name="tomoi" storage="tomoi_normal.png" jname="トモイ"]

[chara_new name="thug" storage="thug_normal.png" jname="荒くれ者"]
; 荒くれ者が複数いる場合、見た目が同じならこの定義を使いまわし、
; 表示位置やセリフで区別するか、あるいは thug1, thug2 のように別IDで定義しても良い
*auguste_arrival

; 背景をアウギュステの街に変更 (例: data/bgimage/auguste_town.jpg を用意)
[bg storage="auguste_town.jpg" time="1000"]

; このルートでは基本的に主人公一人の視点なので、特定のキャラクターを表示し続ける必要はない
#
君はアウギュステに降り立った。[p]
街はバレンタイン一色に染まり、[p]
右を見ても左を見ても、[r]
チョコを共に送り合う恋人達で溢れていた。[p]
嫉妬の炎が胸を焦がす。[r]
このままではこの炎は頭の中までも焦がし、君は狂ってしまうだろう。[p]

君は...[l]

; 選択肢
[glink  text="海までダッシュ！" target="*dash_to_sea"]
[glink  text="無心で買い物へ" target="*shopping_mindlessly_badend"]
[glink  text="船に戻る" target="*return_to_ship_badend"]
[s]

*return_to_ship_badend 
    ; [playse storage="select_se.wav"]
    [bg storage="ship_interior.jpg" time="500"]
    君は船に戻った。[p]
    ムードに気圧され、圧倒された。[p]
    自分の情けなさに嫌気がさし、[p]
    君は膝を抱えたまま、眠りに落ちた。[p]
    BAD END [l]
    [jump storage="first.ks" target="*start"] 

*shopping_mindlessly_badend 
    ; [playse storage="select_se.wav"]
     ; ★★★ 背景をカフェに変更 (流用) ★★★
    [bg storage="cafe_bg.jpg" time="500"]
    君は無心で買い物へ出かけた。[p]

    「ねぇ、まりっぺ！これ美味しそう！」[p]
    「メグ...！これってカップル専用の...！[r]
    そんなに私の事を...！」[p]
    「ジュリエット、君にこのチョコ指輪を贈らせてくれ！」[p]
    「ロミオ...！」[p]

    無心、無心、無━[p]
    無理だ、こんな雰囲気の中で[r]
    正気を保てる訳がない。[p]
    君は叫んだ、心の底から、[r]
    全ての鬱憤を吐き出す様に━[p]

    誰かが、肩に手を置いた。[p]
    「事案ですか？」[p]
    BAD END [l]
    [jump storage="first.ks" target="*start"]

*dash_to_sea 
    ; [playse storage="select_se.wav"]

  

    君は海まで走った。[p]
    周りに目もくれず、ひた走る。[p]
    海に着いた君は、剣を振りつづけていた。[p]
    999回、1000回━[p]
    無心で素振りを続けた結果、[r]
    君の素振りは、音を置き去りにしていた。[l]

    そんな君の前に現れたのは...[l]

    ; 次の選択肢
    [glink  text="荒くれ者達" target="*thugs_appear_badend"]
    [glink  text="海のトンチキ生物達" target="*sea_creatures_appear"]
    [glink  text="ローアイン達" target="*lowain_appear_badend"]
    [s]

; 以下、各選択肢の先の展開を記述していく
; *thugs_appear_badend
; *sea_creatures_appear
; *lowain_appear_badend