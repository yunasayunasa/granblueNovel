; narumia_scenario.ks

*cafe_scene

; 背景をカフェに変更
[bg storage="cafe_bg.jpg" time="1000"] ; data/bgimage/cafe_bg.jpg を用意

; ナルメアは既に表示されているはず (もし必要ならここで [chara_show name="narumia" ...])

; サンダルフォンのキャラクター定義と表示
[chara_new name="sandalphon" storage="sandalphon_normal.png" jname="サンダルフォン"] ; data/fgimage/sandalphon_normal.png を用意
[chara_show name="sandalphon" x="300" y="150"] ; x, y はナルメアと重ならない位置に調整

君はナルメアと共にグランサイファー船内にある[r]
カフェへと辿り着いた。[l]

#サンダルフォン
注文は？[l]

#ナルメア
団長ちゃん！[r]
この【熱々！ホットチョコレート】なんて[r]
いいんじゃないかな？[l]

注文するのは...[l]

; 選択肢
[glink color="blue" x="70" y="250" width="300" size="24" text="オリジナルブレンド" target="*order_original_blend"]
[glink color="blue" x="70" y="320" width="300" size="24" text="ホットチョコレート" target="*order_hot_chocolate"]
[s]

*order_hot_chocolate
; ホットチョコレートを選んだ場合の処理
[chara_mod name="narumia" face="happy"] ; ナルメアの表情を笑顔に (表情差分があれば)
君はホットチョコレートを注文した。[l]

#ナルメア
熱いからお姉さんがふーふーして[r]
冷ましてあげるね、ふー、ふー...[r]
はい、あーん[l]

美味しい？よかった！[p]
ふふっ♪すぐに見つかったね、[r]
チョコがもらえる世界。[l]

ハッピーバレンタイン♪[l]

君は無事チョコを貰うことができた。[r]
団欒していると、いつの間にか君の周りには[r]
仲間達が現れ、チョコを渡しに来た。[l]

━皆と大切に絆を紡いでいた君は、[r]
態々演算するまでもなく、[r]
チョコを貰える世界にいたのだ。[l]

～ナルメアEND～[l]

[jump storage="first.ks" target="*start"] ; タイトルに戻る (first.ksの*startラベルへ)

*order_original_blend
; オリジナルブレンドを選んだ場合の処理
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

; 次の選択肢
[glink color="blue" x="70" y="250" width="300" size="24" text="...苦い" target="*answer_bitter"]
[glink color="blue" x="70" y="320" width="300" size="24" text="...美味しい！" target="*answer_delicious"]
[s]

*answer_bitter
; 「苦い」と答えた場合の処理
; ... (ゲームブックのテキストに従って記述) ...
[jump storage="first.ks" target="*start"] ; 仮でタイトルへ

*answer_delicious
; 「美味しい！」と答えた場合の処理 (サンダルフォンEND)
; ... (ゲームブックのテキストに従って記述) ...
#サンダルフォン
ハッピーバレンタイン、団長。[l]
～サンダルフォンEND～[l]
[jump storage="first.ks" target="*start"] ; タイトルへ

; このファイルの最後に @endjump は不要 (各ルートの最後でジャンプしているため)