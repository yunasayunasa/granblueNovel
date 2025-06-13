; narumia_scenario.ks

*cafe_scene

; 背景をカフェに変更
[bg storage="cafe_bg.jpg" time="1000"]

; ナルメアを表示 (前のシナリオから引き継いでいるか、ここで表示)
[chara_show name="narumia" x="150" y="150"] 

君はナルメアと共にグランサイファー船内にある[r]
カフェへと辿り着いた。[p]


[chara_hide name="narumia" time="200" wait="true"]
; ----- キャラクター定義 -----
[chara_new name="roger" storage="roger_normal.png" jname="ロジャー"]
[chara_new name="narumia" storage="narumia_normal.png" jname="ナルメア"]
[chara_new name="flash" storage="red_flash.png" jname="フラッシュ"]


[chara_new name="sandalphon" storage="sandalphon_normal.png" jname="サンダルフォン"]


[chara_new name="diantha" storage="diantha_normal.png" jname="ディアンサ"]
[chara_new name="anthuria" storage="anthuria_normal.png" jname="アンスリア"]

[chara_new name="nier" storage="nier_normal.png" jname="ニーア"]
[chara_face name="nier" face="give_choco" storage="nier_give_choco.png"] 
[chara_face name="nier" face="yandere" storage="nier_yandere.png"]  

[chara_new name="death" storage="death_stand.png" jname="デス"]
[chara_new name="sandalphon" storage="sandalphon_normal.png" jname="サンダルフォン"]

[chara_show name="sandalphon" x="150" y="150" time="500" wait="true"]

#サンダルフォン
注文は？[p]

[chara_hide name="sandalphon" time="200" wait="true"]
[chara_show name="narumia" x="150" y="150" time="500" wait="true"]

#ナルメア
団長ちゃん！[r]
この【熱々！ホットチョコレート】なんて[r]
いいんじゃないかな？[p]

注文するのは...[l] 


[glink color="blue" x="70" y="250" width="200" size="28" text="オリジナルブレンド" target="*order_original_blend"]
[glink color="blue" x="70" y="350" width="200" size="28" text="ホットチョコレート" target="*order_hot_chocolate"]
[s]

*order_hot_chocolate
 
    君はホットチョコレートを注文した。[p]

    #ナルメア
    熱いからお姉さんがふーふーして[r]
    冷ましてあげるね、ふー、ふー...[r]
    はい、あーん[p]

    美味しい？よかった！[p]
    ふふっ♪すぐに見つかったね、[r]
    チョコがもらえる世界。[p]

    ハッピーバレンタイン♪[p]

    君は無事チョコを貰うことができた。[r]
    団欒していると、いつの間にか君の周りには[r]
    仲間達が現れ、チョコを渡しに来た。[p]

    ━皆と大切に絆を紡いでいた君は、[r]
    態々演算するまでもなく、[r]
    チョコを貰える世界にいたのだ。[p]

    ～ナルメアEND～[l] 

    [chara_hide name="narumia" time="500" wait="true"]
  [jump storage="first.ks" target="*start"]

*order_original_blend
   
    [chara_hide name="narumia" time="200" wait="true"]
    [chara_show name="sandalphon" x="150" y="150" time="500" wait="true"]

    君はオリジナルブレンドを注文した。[p]

    #サンダルフォン
    オリジナルブレンドだ。[r]
    良ければ感想を聞かせて欲しい。[p]

    君はコーヒーを一口飲んだ。[r]
    芳醇な香りが口の中に広がり、[r]
    調和の取れた苦味と酸味が踊り出す。[p]

    #サンダルフォン
    どうだ？[p]

    君は答えた。[l] 

    
    [glink color="blue" x="70" y="250" width="200" size="28" text="...苦い" target="*answer_bitter"]
    [glink color="blue" x="70" y="350" width="200" size="28" text="...美味しい！" target="*answer_delicious"]
    [s]

*answer_bitter
  
    君は苦いと答えた[p]

    #サンダルフォン
    そうか...、苦ければラテにする事もできる。[r]
    砂糖とミルクを置いておく、[r]
    好きに使うといい。[p]

    ...もう少し配合を変えてみるか。[p]

    サンダルフォンは呟きながら、[r]
    考え込み始めた。[p]

    君は...[l]
    ; 次の選択肢 (この先の展開はゲームブックに従う)
    [glink color="blue" x="70" y="250" width="200" size="28" text="席を立つ" target="*bitter_leave_cafe"]
    [glink color="blue" x="70" y="350" width="200" size="28" text="ゆっくりする" target="*bitter_relax_cafe"]
    [s]

*answer_delicious
  
    君は美味しいと答えた。[p]

    #サンダルフォン
    口にあったのならよかった。[p]
    ペアリングは要るか？[p]
    ...ちょうどバレンタインだしな。[p]
    こんなものでよければ、食べてくれ。[p]

    サンダルフォンは、その華奢な指で丁寧に、[r]
    ラッピングが施された包みを差し出した。[p]

    #サンダルフォン
    ハッピーバレンタイン、団長。[p]

    ～サンダルフォンEND～[l] 
    [chara_hide name="sandalphon" time="500" wait="true"]
   [jump storage="first.ks" target="*start"]


; ----- 「苦い」と答えた後の分岐 -----
*bitter_leave_cafe
 
    [chara_hide name="sandalphon" time="200" wait="true"] 
    君はコーヒー飲み干し、[r]
    カフェを出ようとした。すると、[p] 

   
    [jump target="*three_girls_appear_after_leave"]

*bitter_relax_cafe
   
    君はコーヒーを味わいながら[r]
    もう少し寛ぐことにした。[p] 

   
    [jump target="*three_girls_appear_after_relax"]


; ----- ディアンサ、アンスリア、ニーア登場シーン共通部分 -----
*three_girls_appear_common
    ; 必要であれば前のキャラクターを消す (サンダルフォンなど)
    [chara_hide name="sandalphon" time="100" wait="true"]

    「「「団長さん、ここにいたんだ。[r]
    探したんだよ？」」」[p]

    君の前に3人の見目麗しい女性が現れた。[r]
    君を探していたようだ。[p]


    何やら殺気立っている様子だ。[l]

   

    
    ; ディアンサのセリフ
    [chara_show name="diantha" x="150" y="150" time="300" wait="true"] 
    #ディアンサ
    団長さん！はい！チョコレート！[r]
    受け取って！[p]
    [chara_hide name="diantha" time="200" wait="true"]

    ; アンスリアのセリフ
    [chara_show name="anthuria" x="150" y="150" time="300" wait="true"]
    #アンスリア
    チョコ、作ってきたの、団長さんの為に。[r]
    受け取って欲しいな...？[p]
    [chara_hide name="anthuria" time="200" wait="true"]

    ; ニーアのセリフ (チョコを渡す時の表情)
    [chara_show name="nier" face="give_choco" x="150" y="150" time="300" wait="true"]
    #ニーア
    団長さん...？[r]
    受け取ってくれるよね...？[r]
    愛して...くれるよね...？[l]
    ; 選択肢の前にニーアは表示したままにするか、消すかはお好みで。ここでは表示したまま。

    君は...[l]

    ; 選択肢 (誰から受け取るか)
    [glink color="blue" x="70" y="250" width="200" size="28" text="ディアンサから受け取る" target="*receive_diantha_or_anthuria"]
    [glink color="blue" x="70" y="350" width="200" size="28" text="アンスリアから受け取る" target="*receive_diantha_or_anthuria"]
    [glink color="blue" x="70" y="450" width="200" size="28" text="ニーアから受け取る" target="*receive_nier_good_end"]
    [s]

; ----- チョコ受け取り処理とエンディング分岐 -----

*receive_diantha_or_anthuria ; ディアンサまたはアンスリアから受け取った場合 (BAD END)
    [chara_hide name="nier" time="100" wait="true"] ; 選択肢表示時にいたニーアを消す
    君はチョコを受け取った。[p]

    ; ニーアのセリフ (ヤンデレ顔で再登場)
    [chara_show name="nier" face="give_choco" x="150" y="150" time="500" wait="true"]
    #ニーア
    どうして...？どうして受け取ってくれないの...？[r]
    愛してくれないの...？私のことを捨てるの...？[r]
    あの人達みたいに...[p]

    嫌！嫌あああああ！[r]
    お願い！捨てないで！私を...、愛して...[p]
    [chara_hide name="nier" time="200" wait="true"]

    ; デス登場
    [chara_show name="death" x="150" y="150" time="500" wait="true"]
    #デス
    愛シイ人、人ノ愛ハ移リ行クモノ。[r]
    永遠ノ愛ヲ求メルナラ、答エハヒトツ...[p]
    [chara_hide name="death" time="200" wait="true"]

    ; ニーア再登場 (ヤンデレ顔のまま)
    [chara_show name="nier" face="give_choco" x="150" y="150" time="500" wait="true"]
    #ニーア
    ...そっか、そうだよね...。[r]
    移ろう前に...一つになればいいんだ...。[p]

     [chara_hide name="nier" time="200" wait="true"]

    [chara_show name="nier" face="yandere" x="150" y="150" time="500" wait="true"]

    デス、お願い。[l] 

  ; ★★★ 赤いフラッシュ演出 (修正案1) ★★★
        [eval exp="alert('赤フラッシュ前');"]
        [image storage="red_flash.png" layer="fix" x="0" y="0" width="&TYRANO.kag.config.scWidth" height="&TYRANO.kag.config.scHeight" time="50" wait="false" zindex="9999"]
        [wait time="150"] ; 表示と描画のための少し長めのウェイト
        [eval exp="alert('赤画像表示後、消去前');"]
        [freeimage layer="fix" time="50" wait="false"]
        [wait time="150"] ; 消去と描画のための少し長めのウェイト
        [eval exp="alert('赤フラッシュ完了、黒背景表示前');"] 

        ; ★★★ 背景を暗転させる ★★★
       [bg storage="calc_space.jpg"] 
        [eval exp="alert('黒背景表示試行後');"]
        ; ニーア再登場 (ヤンデレ顔のまま、暗い背景に)
        [chara_show name="nier" face="yandere" x="150" y="150" time="500" wait="true"]
        #ニーア
        ずっと、ずっと一緒だよ...。[p]
        [chara_hide name="nier" time="500" wait="true"]

        ; ロジャーのセリフ (この時も背景は暗いままか、元の背景に戻すか)
        ; [bg storage="calc_space.jpg" time="100"] ; もしここで元の背景に戻すなら
        [chara_show name="roger" x="150" y="150" time="500" wait="true"]
        #ロジャー
        うわあああああ！まずい！[r]
        再演算！演算し直さなきゃ！[p]
        [chara_hide name="roger" time="500" wait="true"]

        BAD END [l]
        [jump target="*three_girls_appear_common"]

*receive_nier_good_end ; ニーアから受け取った場合 (Good END)
    ; ニーアは give_choco の表情で表示されているはず
    ; [chara_mod name="nier" face="happy_smile"] ; もしここでさらに表情を変えるなら (例: とても嬉しい笑顔)
    君はニーアからチョコを受け取った。[p]

    #ニーア
    嬉しい...！私ね、団長さんの為なら[r]
    なんでもできる...。[r]
    団長さんが愛してくれるなら、なんでも...。[p]
    ; この後ニーアは表示したままで、他のキャラが割り込んでくる想定

    ; ディアンサのセリフ
    [chara_hide name="nier" time="100" wait="true"] ; ニーアを消してディアンサ表示
    [chara_show name="diantha" x="150" y="150" time="300" wait="true"]
    #ディアンサ
    あー！ずるい！ニーアさんだけじゃなくて、[r]
    私のも受け取ってよ！[p]
    [chara_hide name="diantha" time="200" wait="true"]

    ; アンスリアのセリフ
    [chara_show name="anthuria" x="150" y="150" time="300" wait="true"]
    #アンスリア
    わ、私のも受け取って！[r]
    それで、中に手紙が入ってるの...！[r]
    そこで待ってるから！2人っきりで...[p]
    [chara_hide name="anthuria" time="200" wait="true"]

    ; ナルメアのセリフ
    [chara_show name="narumia" x="150" y="150" time="300" wait="true"]
    #ナルメア
    お姉さんも用意してあるんだから！[r]
    はい、あーんしてあげる♪[p]
    [chara_hide name="narumia" time="200" wait="true"]

    ; サンダルフォンのセリフ
    [chara_show name="sandalphon" x="150" y="150" time="300" wait="true"]
    #サンダルフォン
    お前達、静かにしろ！[p]
    [chara_hide name="sandalphon" time="500" wait="true"]

    ━━かしましい声が響き辺り、[r]
    今日もグランサイファーは平和そのものであった。[p]

    Good END[p]

    ???「...どうしよう。うち、完っ全に出遅れてる...！」[l]
    [jump storage="first.ks" target="*start"]