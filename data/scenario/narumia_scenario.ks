; narumia_scenario.ks

*cafe_scene

; 背景をカフェに変更
[bg storage="cafe_bg.jpg" time="1000"]

; 最初はナルメアだけ表示されている状態 (前のシナリオから引き継ぎ)
; もし、ここでナルメアを再表示するなら
; [chara_show name="narumia" x="中央あたりのX" y="適切なY"]

君はナルメアと共にグランサイファー船内にある[r]
カフェへと辿り着いた。[l]

; サンダルフォン登場 -> ナルメアを一旦消すか、位置を調整してサンダルフォンをメインに
[chara_hide name="narumia" time="200" wait="true"] ; ナルメアを消す場合
[chara_new name="sandalphon" storage="sandalphon_normal.png" jname="サンダルフォン"]
[chara_show name="sandalphon" x="画面中央のX" y="適切なY" time="500" wait="true"] ; サンダルフォンを表示

#サンダルフォン
注文は？[l]

; ナルメアが話す -> サンダルフォンを消してナルメアを表示
[chara_hide name="sandalphon" time="200" wait="true"]
[chara_show name="narumia" x="画面中央のX" y="適切なY" time="500" wait="true"] ; ナルメアを再表示

#ナルメア
団長ちゃん！[r]
この【熱々！ホットチョコレート】なんて[r]
いいんじゃないかな？[l]

注文するのは...[l]

; 選択肢 (この時点ではナルメアが表示されている)
[glink color="blue" x="70" y="250" width="300" size="24" text="オリジナルブレンド" target="*order_original_blend"]
[glink color="blue" x="70" y="320" width="300" size="24" text="ホットチョコレート" target="*order_hot_chocolate"]
[s]

*order_hot_chocolate
    ; ホットチョコレートを選んだ (ナルメアがメインで話す)
    ; ナルメアが表示されたまま
    [chara_mod name="narumia" face="happy"] ; 表情変更
    君はホットチョコレートを注文した。[l]

    #ナルメア
    熱いからお姉さんがふーふーして[r]
    冷ましてあげるね、ふー、ふー...[r]
    はい、あーん[l]

    美味しい？よかった！[p]
    ふふっ♪すぐに見つかったね、[r]
    チョコがもらえる世界。[l]

    ハッピーバレンタイン♪[l]

    ; ... (エンディングの地の文) ...
    ～ナルメアEND～[l]
    [chara_hide name="narumia" time="500" wait="true"] ; 最後にナルメアを消す
    [jump storage="first.ks" target="*start"]

*order_original_blend
    ; オリジナルブレンドを選んだ (サンダルフォンがメインで話す)
    ; ナルメアを消してサンダルフォンを表示
    [chara_hide name="narumia" time="200" wait="true"]
    [chara_show name="sandalphon" x="画面中央のX" y="適切なY" time="500" wait="true"]

    君はオリジナルブレンドを注文した。[l]

    #サンダルフォン
    オリジナルブレンドだ。[r]
    良ければ感想を聞かせて欲しい。[l]

    君はコーヒーを一口飲んだ。[r]
    芳醇な香りが口の中に広がり、[r]
    調和の取れた苦味と酸味が踊り出す。[l]

    #サンダルフォン
    どうだ？[l]

    君は答えた。[l]

    ; 次の選択肢 (この時点ではサンダルフォンが表示されている)
    [glink color="blue" x="70" y="250" width="300" size="24" text="...苦い" target="*answer_bitter"]
    [glink color="blue" x="70" y="320" width="300" size="24" text="...美味しい！" target="*answer_delicious"]
    [s]

*answer_bitter
    ; 「苦い」と答えた (サンダルフォンが話す)
    ; サンダルフォンが表示されたまま
    ; ... (サンダルフォンのセリフと地の文) ...
    [chara_hide name="sandalphon" time="500" wait="true"] ; 最後にサンダルフォンを消す
    [jump storage="first.ks" target="*start"]

*answer_delicious
    ; 「美味しい！」と答えた (サンダルフォンが話す - サンダルフォンEND)
    ; サンダルフォンが表示されたまま
    ; [chara_mod name="sandalphon" face="smile"] ; 表情変更 (もしあれば)
    ; ... (サンダルフォンのセリフと地の文) ...
    #サンダルフォン
    ハッピーバレンタイン、団長。[l]
    ～サンダルフォンEND～[l]
    [chara_hide name="sandalphon" time="500" wait="true"] ; 最後にサンダルフォンを消す
    [jump storage="first.ks" target="*start"]