; narumia_scenario.ks

*cafe_scene

; 背景をカフェに変更
[bg storage="cafe_bg.jpg" time="1000"]

; ナルメアを表示 (前のシナリオから引き継いでいるか、ここで表示)
[chara_show name="narumia" x="150" y="150"] 

君はナルメアと共にグランサイファー船内にある[r]
カフェへと辿り着いた。[p]


[chara_hide name="narumia" time="200" wait="true"]
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


[glink color="blue" x="70" y="250" width="300" size="24" text="オリジナルブレンド" target="*order_original_blend"]
[glink color="blue" x="70" y="320" width="300" size="24" text="ホットチョコレート" target="*order_hot_chocolate"]
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
   [jump storage="title_screen.ks" target="*show_title"]

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

    
    [glink color="blue" x="70" y="250" width="300" size="24" text="...苦い" target="*answer_bitter"]
    [glink color="blue" x="70" y="320" width="300" size="24" text="...美味しい！" target="*answer_delicious"]
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
    [glink color="blue" x="70" y="250" width="300" size="24" text="席を立つ" target="*bitter_leave_cafe"]
    [glink color="blue" x="70" y="320" width="300" size="24" text="ゆっくりする" target="*bitter_relax_cafe"]
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
    [jump storage="title_screen.ks" target="*show_title"]


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


; ----- ディアンサ、アンスリア、ニーア登場シーン共通部分 (仮) -----
*three_girls_appear_common
    ; 必要であれば前のキャラクターを消す
    [chara_hide name="sandalphon" time="100" wait="true"] ; もしサンダルフォンが表示されていたら

    ; 3人のうち誰か1人を代表して表示するか、あるいはテキストのみで進行するか
    ; ここでは仮にテキストのみで進行し、選択肢で誰のチョコを受け取るかを選ぶ
    ; [chara_new name="diantha" storage="diantha_normal.png" jname="ディアンサ"]
    ; [chara_new name="anthuria" storage="anthuria_normal.png" jname="アンスリア"]
    ; [chara_new name="nier" storage="nier_normal.png" jname="ニーア"]
    ; (立ち絵はまだないので、名前表示のみで進行するか、[chara_show]は後で追加)

    「「「団長さん、ここにいたんだ。[r]
    探したんだよ？」」」[p]

    君の前に3人の見目麗しい女性が現れた。[r]
    君を探していたようだ。[p]
    何やら殺気立っている様子だ。[l]

    #ディアンサ
    団長さん！はい！チョコレート！[r]
    受け取って！[p]

    #アンスリア
    チョコ、作ってきたの、団長さんの為に。[r]
    受け取って欲しいな...？[p]

    #ニーア
    団長さん...？[r]
    受け取ってくれるよね...？[r]
    愛して...くれるよね...？[l]

    君は...[l] 

    ; 選択肢 (誰から受け取るか)
    [glink color="blue" x="70" y="250" width="300" size="24" text="ディアンサから受け取る" target="*receive_diantha"]
    [glink color="blue" x="70" y="320" width="300" size="24" text="アンスリアから受け取る" target="*receive_anthuria"]
    [glink color="blue" x="70" y="390" width="300" size="24" text="ニーアから受け取る" target="*receive_nier"]
    [s]


; ----- 「席を立つ」を選んだ後の3人娘登場 -----
*three_girls_appear_after_leave
    ; (ここまでの地の文は bitter_leave_cafe で表示済み)
    [jump target="*three_girls_appear_common"]

; ----- 「ゆっくりする」を選んだ後の3人娘登場 -----
*three_girls_appear_after_relax
    ; (ここまでの地の文は bitter_relax_cafe で表示済み)
    「「「団長さん、ここにいたんだ。[r]
    探したんだよ？」」」[p]
    君の前に3人の見目麗しい女性が現れた。[r]
    君を探していたようだ。[l]
    [jump target="*three_girls_appear_common"]


; ----- チョコ受け取り処理とエンディング分岐 -----
*receive_diantha
    ; ディアンサから受け取った (BAD ENDへ)
    君はチョコを受け取った。[p] ; ← ゲームブックでは「君はディアンサからチョコを受け取った」のはず

    #ニーア
    どうして...？どうして受け取ってくれないの...？[r]
    愛してくれないの...？私のことを捨てるの...？[r]
    あの人達みたいに...[p]

    嫌！嫌あああああ！[r]
    お願い！捨てないで！私を...、愛して...[p]

    #デス
    愛シイ人、人ノ愛ハ移リ行クモノ。[r]
    永遠ノ愛ヲ求メルナラ、答エハヒトツ...[p]

    #ニーア
    ...そっか、そうだよね...。[r]
    移ろう前に...一つになればいいんだ...。[p]

    デス、お願い。[p]

    ずっと、ずっと一緒だよ...。[p]

    #ロジャー
    うわあああああ！まずい！[r]
    再演算！演算し直さなきゃ！[p]

    BAD END [l]

    [jump target="*three_girls_appear_common"] ; 再演算 (一つ前の選択肢へ)
   [jump storage="title_screen.ks" target="*show_title"]

*receive_anthuria
    ; アンスリアから受け取った (BAD ENDへ)
    君はチョコを受け取った。[p] ; ← ゲームブックでは「君はアンスリアからチョコを受け取った」のはず
    ; (BAD END の内容は上記 receive_diantha と同じなので省略。内容は同じものを記述)
    #ニーア
    どうして...？ (以下略) ...[p]
    BAD END [l]
    [jump target="*three_girls_appear_common"]
   [jump storage="title_screen.ks" target="*show_title"]

*receive_nier
    ; ニーアから受け取った (Good ENDへ)
    君はニーアからチョコを受け取った。[p]

    #ニーア
    嬉しい...！私ね、団長さんの為なら[r]
    なんでもできる...。[r]
    団長さんが愛してくれるなら、なんでも...。[p]

    #ディアンサ
    あー！ずるい！ニーアさんだけじゃなくて、[r]
    私のも受け取ってよ！[p]

    #アンスリア
    わ、私のも受け取って！[r]
    それで、中に手紙が入ってるの...！[r]
    そこで待ってるから！2人っきりで...[p]

    ; ナルメア登場
    [chara_show name="narumia" x="150" y="150" time="500" wait="true"]
    #ナルメア
    お姉さんも用意してあるんだから！[r]
    はい、あーんしてあげる♪[p]

    ; サンダルフォン登場
    [chara_hide name="narumia" time="100" wait="true"] ; 一旦ナルメアを消すか、位置を調整
    [chara_show name="sandalphon" x="150" y="150" time="500" wait="true"]
    #サンダルフォン
    お前達、静かにしろ！[p]

    ━━かしましい声が響き辺り、[r]
    今日もグランサイファーは平和そのものであった。[p]

    Good END[p]

    「...どうしよう。うち、完っ全に出遅れてる...！」[l] ; 最後のセリフ後なので [l]
    [chara_hide name="sandalphon" time="500" wait="true"] ; 表示されているキャラを消す
   [jump storage="title_screen.ks" target="*show_title"]