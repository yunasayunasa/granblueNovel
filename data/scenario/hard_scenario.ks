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
    [glink  text="荒くれ者達" target="*thugs_appear_badend_hard"] ; ラベル名を少し変更
    [glink  text="海のトンチキ生物達" target="*sea_creatures_appear_hard"]
    [glink  text="ローアイン達" target="*lowain_appear_badend_hard"]
    [s]

*thugs_appear_badend_hard 
    ; [playse storage="select_se.wav"]
    ; 背景は海のまま

    君の前に現れたのは荒くれ者達だった。[p]

    ; 荒くれ者を表示
    [chara_show name="thug" x="150" y="150" time="500" wait="true"] 
    #荒くれ者
    こんなとこで剣なんか振ってんじゃねえよ！[r]
    あぶねえだろうが！[p]
    [chara_hide name="thug" time="300" wait="true"]
#
    ...正論を振りかざされ、君は心が折れた。[p]
    BAD END [l]
    [jump storage="first.ks" target="*start"]

*lowain_appear_badend_hard 
    ; [playse storage="select_se.wav"]
    ; 背景は海のまま

    君の前に現れたのはローアイン達だった。[p]

    ; ローアインを表示 (エルセムとトモイは出さないのでローアインのみ)
    [chara_show name="lowain" x="150" y="150" time="500" wait="true"]
    #ローアイン
    あれ？ﾀﾞﾝﾁｮ？[r]
    こんなとこで剣なんか振っちゃってDoしたん？[p]
    ; トモイのセリフ (ローアインが代弁するか、地の文で)
    ; #トモイ
    ; 「俺たち今からそこの海の家でダベるんすよ。ﾀﾞﾝﾁｮもDoすか？」[p]
    ; エルセムのセリフ
    ; #エルセム
    ; 「一緒にグラブっちゃいまっしょ！フワッフワッ！」[p]
    ; もしローアインが全部言うなら上記のように。地の文で補足も可。
    ; ここでは台本通り、各キャラが言っている体で進めます（立ち絵はローアインのみ）
    

#
    君はローアイン達と海の家でダベることにした。[p]
    妄想トークが捗り、[r]
    非常に楽しい1日を過ごした━[p]

    [chara_hide name="lowain" time="300" wait="true"]
    ; ロジャー登場
    [chara_show name="roger" x="150" y="150" time="500" wait="true"]
    #ロジャー
    ちょちょちょい！待って！[r]
    チョコ忘れてない！？再演算！[p]
    [chara_hide name="roger" time="300" wait="true"]
    #
    BAD END[l]
    [jump storage="first.ks" target="*start"]

*sea_creatures_appear_hard ; 「海のトンチキ生物達」を選んだ
    ; [playse storage="select_se.wav"]
    ; 背景は海のまま
    ; ここではまだキャラクターは表示しない（地の文で進行）

    君の前に現れたのは、海のトンチキ生物達だった。[p]
    カキフライ「━━━━！」[p]
    ンニ「━━━━━！！！」[p]
    カツウォヌス「━━━━━━━！！！！！」[p]

    前から後ろから、左右から、[r]
    海の生物が襲いかかる。[l]
    どれから対処すべきか...[l]

    ; 次の選択肢
    [glink color="blue" x="70" y="250" width="250" size="24" text="ンニ" target="*failed_battle_badend"] 
    [glink color="blue" x="70" y="320" width="250" size="24" text="カツウォヌス" target="*progress_battle_1"] 
    [glink color="blue" x="70" y="390" width="250" size="24" text="カキフライ" target="*failed_battle_badend"] 
    [s]

*failed_battle_badend 
    ; [playse storage="select_se.wav"]
    ; 背景は海のままか、自室の背景に変更するか
    ; [bg storage="my_room_bg.jpg" time="500"] ; もし自室の背景があるなら
#
    君は目を覚ました。[p]
    見知った天井、自分の部屋だ。[p]

    ; ルリア登場
    [chara_show name="ruria" x="150" y="150" time="500" wait="true"]
    #ルリア
    大丈夫ですか？[r]
    今、ティコさんを呼んできますね！[p]
    [chara_hide name="ruria" time="300" wait="true"]
#
    どうやら選択を誤ったらしい。[p]
    全身の痛みに生を実感しながら、[p]
    君は、目を閉じた。[p]
    BAD END [l]
    [jump storage="first.ks" target="*start"]


*progress_battle_1 
    ; [playse storage="select_se.wav"]
    ; 背景は海のまま

    カキフライ「━━━━！？」[p] 
    まずは1つ、次は━[p]
    ンナギ「━━━！」[p]
    アルバコア「━━━━！！！」[p]
    #
    増援。君は選択を迫られる...[l]

    ; 次の選択肢
    [glink  text="ンナギ" target="*final_battle_badend"]
    [glink  text="ンニ" target="*final_battle_badend"]
    [glink  text="アルバコア" target="*final_battle_badend"]
    [glink  text="カツウォヌス" target="*final_battle_badend"] 
    [s]

*final_battle_badend ; 戦闘最終盤 (BAD END)
    ; [playse storage="select_se.wav"]
    ; 背景は海のまま

    マツヴァガニ「━━━━！！」[p]
    灼弩火罹「━━！」[p]
    ゾンビィ「ドライブイン！とっ！りっ！」[p] 

    更に増えるトンチキ生物達。[p]
    無理だ。1人では━[p]
    君は押し迫る海の生物達の中に消えていった...。[p]

    ; ★★★ ここで「再演算する」か「タイトルに戻る」の選択肢 ★★★
    ; 台本ではリンクになっているが、ゲームの選択肢として実装
    [glink color="orange" x="70" y="400" width="300" size="24" text="再演算する" target="*restart_hard_mode_sea"] ; 海のシーンの最初に戻るなど調整
    [glink color="gray" x="70" y="470" width="300" size="24" text="最初のシナリオに戻る" target="*jump_to_prologue_from_hard"]
    [s]

*restart_hard_mode_sea
    ; [playse storage="select_se.wav"]
    ; 海のトンチキ生物との遭遇の最初に戻る
    [jump target="*sea_creatures_appear_hard"]

*jump_to_prologue_from_hard
    ; [playse storage="select_se.wav"]
    [jump storage="first.ks" target="*start"]