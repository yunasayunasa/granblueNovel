; siete_scenario.ks

*deck_scene_start
[chara_new name="oigen" storage="oigen_normal.png" jname="オイゲン"] 
; data/fgimage/oigen_normal.png を用意
; 背景を甲板に変更
[bg storage="deck_bg.jpg" time="1000"]

; シエテが表示されている状態 (first.ksから引き継ぎ、またはここで再表示)
; [chara_show name="siete" x="150" y="150"] ; 必要であれば表示位置を再調整

君はシエテと共に甲板に出た。[p]

#シエテ
チョコを受け取れる世界と言っても、[r]
団長ちゃんなら引く手数多でしょ？[p]
ここで待っててもいいんじゃないかな？[p]

それとも...、[r]
１つ手合わせでもしながら暇を潰すかい？[l]

; 選択肢
[glink color="blue" x="70" y="250" width="300" size="24" text="静かに待つ" target="*wait_quietly"]
[glink color="blue" x="70" y="320" width="300" size="24" text="手合わせする" target="*spar_with_siete"]
[s]

*wait_quietly
    ; 「静かに待つ」を選んだ場合の展開
    君は静かに待つことにした。[p]

    静かに━[p]
    ...ヤッ！[p]
    ......ソイヤッ！[p]
    静かに...待[p]
    ソイヤッ！ソイヤッ！[p]
      ; ★★★ シエテを一旦消す (3人組を目立たせるため) ★★★
    [chara_hide name="siete" time="200" wait="true"]

    ; ★★★ 三人組を登場させる ★★★
    ; 位置は仮です。画面サイズ (450x800) に合わせて、3人が重ならず、
    ; かつ暑苦しい感じが出るように配置を調整してください。
    ; 例: 左からジン、中央にソリッズ、右にオイゲン
   
    [chara_show name="oigen" x="150" y="150" time="300" wait="true"] 

    ; ★★★ 「ソイヤアアアアアアアアアッッッッ！！！！！」の文字を太く大きく ★★★
    [font size="40" bold="true" color="red"] ; 例: サイズ40、太字、赤色
    「「「ソイヤアアアアアアアアアッッッッ！！！！！」」」[p]
    [resetfont] ; フォントスタイルをデフォルトに戻す

    君の前に3人の暑苦しい男が現れた。[l] ; キャラクター名は出てこないが、状況説明

    君は...[l]

    ; 次の選択肢
    [glink color="blue" x="70" y="250" width="150" size="28" text="ソイヤッ！" target="*soiya_end"]
    [glink color="blue" x="70" y="320" width="150" size="28" text="うるさい！" target="*scold_them"]
    [s]

*spar_with_siete
    ; 「手合わせする」を選んだ場合の展開
    君はシエテと手合わせする事にした。[p]

    #シエテ
    さて、君がどれほど強くなったか[r]
    見せてもらうよ。[p]
    まずはコレでどうかな！[p]

    シエテが右上段から斬り掛かる。[l]

    君は...[l]

    ; 次の選択肢
    [glink color="blue" x="70" y="250" width="250" size="24" text="左に避ける" target="*dodge_left"]
    [glink color="blue" x="70" y="320" width="250" size="24" text="剣で受ける" target="*block_sword"] 
    [glink color="blue" x="70" y="390" width="250" size="24" text="右に避ける" target="*dodge_right"] 
    [s]

; 以下、各選択肢の先の展開を記述していく
; 例: *soiya_end ラベル、*scold_them ラベル、*dodge_left ラベルなど

; エンディングの最後には [jump storage="first.ks" target="*start"] でプロローグへ戻る