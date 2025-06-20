; siete_scenario.ks

*deck_scene_start
[chara_new name="oigen" storage="oigen_normal.png" jname="オイゲン"] 
[chara_new name="siete" storage="siete_normal.png" jname="シエテ"]
[chara_face name="siete" face="stance" storage="siete_stance.png"] 
[chara_face name="siete" face="granchariot" storage="siete_granchariot.png"] 
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
#
; 選択肢
[glink  text="静かに待つ" target="*wait_quietly"]
[glink  text="手合わせする" target="*spar_with_siete"]
[s]

*wait_quietly
    ; 「静かに待つ」を選んだ場合の展開
    君は静かに待つことにした。[p]
#
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
      ; ★★★ 画面揺らし演出 ★★★
    [quake time="500" count="3" hmax="15" vmax="15" wait="false"]
    ; time: 揺れる合計時間 (ミリ秒)
    ; count: 揺れる回数 (指定しないと揺れ続けるので注意)
    ; hmax: 横揺れの最大幅 (ピクセル)
    ; vmax: 縦揺れの最大幅 (ピクセル)
    ; wait: 揺れが終わるまで待つか (true/false)
#三羽烏
    ; ★★★ 「ソイヤアアアアアアアアアッッッッ！！！！！」の文字を太く大きく ★★★
    [font size="40" bold="true" color="red"]
    「「「ソイヤアアアアアアアアアッッッッ！！！！！」」」[p]
    [resetfont] 
#
    君の前に3人の暑苦しい男が現れた。[p] 
#
    君は...[l]

    ; 次の選択肢
    [glink  text="ソイヤッ！" target="*soiya_with_them"]
    [glink  text="うるさい！" target="*scold_them"]
    [s]

*spar_with_siete 
    ; [playse storage="select_se.wav"] 
    ; シエテが表示されている状態
#
    君はシエテと手合わせする事にした。[p]
 [chara_mod name="siete" face="stance" time="300"] 
    #シエテ
    さて、君がどれほど強くなったか[r]
    見せてもらうよ。[p]
    まずはコレでどうかな！[p]
#
    シエテが右上段から斬り掛かる。[l]

    君は...[l]

    ; 選択肢
    [glink color="blue" x="70" y="250" width="250" size="24" text="左に避ける" target="*spar_dodge_left"]
    [glink color="blue" x="70" y="320" width="250" size="24" text="剣で受ける" target="*spar_block_sword_badend"] 
    [glink color="blue" x="70" y="390" width="250" size="24" text="右に避ける" target="*spar_block_sword_badend"] 
    [s]

*spar_block_sword_badend 
    ; [playse storage="select_se.wav"]
    [chara_hide name="siete" time="200" wait="true"] 
    君は、暗闇から目を覚ました。[r]
    どうやら気絶していたらしい。[p]

    [chara_show name="siete" x="150" y="150" time="500" wait="true"] 
    #シエテ
    ごめん！団長ちゃん！[r]
    団長ちゃんならこれぐらいなら大丈夫と思って、[r]
    強く打ち込みすぎちゃった！[r]
    本当ごめんね！[p]
#
    ベッドの横の時計を見ると、[r]
    既に0時を回っていた。[p]
    バレンタインは、終わったのだ。[p]

    BAD END [p]

    ; ロジャー登場
    [chara_hide name="siete" time="200" wait="true"]
    [chara_show name="roger" x="150" y="150" time="500" wait="true"]
    #ロジャー
    ありゃ！バレンタインおわちゃた！[r]
    再演算再演算！[p]
    [chara_hide name="roger" time="500" wait="true"]

    [jump target="*spar_with_siete"] 

*spar_dodge_left 
    ; [playse storage="select_se.wav"]
    ; シエテが表示されている状態 (通常顔のままか、少し驚いた表情差分があればそれも良い)
#
    君は左に避けた。[p]
    すかさず打ち込むが、[r]
    シエテには容易に防がれる。[p]

    ; ★★★ シエテのポーズ変更 ★★★
    [chara_mod name="siete" face="stance" time="300"] 

    #シエテ
    いいね！さぁ団長ちゃんの番だ！[r]
    かかって来なさい！[p]
#
    君は...[l]

    ; 次の選択肢
    [glink color="blue" x="70" y="250" width="350" size="24" text="横一文字に斬り掛かる" target="*spar_block_sword_badend"] 
    [glink color="blue" x="70" y="320" width="350" size="24" text="大きくジャンプして斬り掛かる" target="*spar_block_sword_badend"] 
    [glink color="blue" x="70" y="390" width="350" size="24" text="後の先を取る為に斬りかからない" target="*spar_dont_attack"]
    [s]

*spar_dont_attack 
    ; [playse storage="select_se.wav"]
    ; シエテは stance のポーズのまま

    君は剣を構えた。[p]

    #シエテ
    へぇ...、そういう手で来るんだね。[r]
    いいよ。じゃあ...[p]

    「本気、出しちゃおっかな。」[p]

    ; ★★★ グランシャリオ発動演出 ★★★
    ; ここで背景を暗転させたり、効果線などのエフェクト画像を表示しても良い
   [filter layer="base" name="brightness" value="-100" time="300"] 
  [image storage="effect_lines.png" layer="1" x="0" y="0" time="100"]
    [chara_mod name="siete" face="granchariot" time="500"] 

    天星剣王の髪が蒼く染まる。[r]
    途方もない剣気が集まるのが分かる。[p]
    体の震えが告げている。[r]
    まともに受ければ、死だと。[p]

    #シエテ
     [font size="35" bold="true"]
    「グラン•シャリオ」[p]
      [resetfont]

#
    君は...[l]

    ; 次の選択肢
    [glink color="blue" x="70" y="250" width="300" size="24" text="ガードで受け止める！" target="*spar_block_sword_badend"] 
    [glink color="blue" x="70" y="320" width="300" size="24" text="一か八かで突っ込む！" target="*spar_block_sword_badend"] 
    [glink color="blue" x="70" y="390" width="300" size="24" text="チョコあげる！" target="*spar_give_choco_siete_end"]
    [s]

*spar_give_choco_siete_end 
    ; [playse storage="select_se.wav"]
    ; シエテは granchariot の立ち絵のままか、ここで通常顔に戻すか
     [chara_show name="siete" x="150" y="150" time="500" wait="true"]
     [freeimage layer="1"] ; もし効果線などを表示していたら消す
     [filter layer="base" name="brightness" value="0" time="300"] 

    君はチョコを差し出した。[p]

    #シエテ
    グランシャリ...え？僕に？[r]
    くれるのかい？ありがとう、団長ちゃん！[p]
    とても嬉しいよ！[p]

    あ、そうだ。お返ししなくちゃね。[r]
    はい、コレ！十天衆チョコ！[p]
#
    シエテからチョコを受け取った。[p]
    ...中にはデフォルメされたシエテのシールと共に、[r]
    ウエハースチョコが入っていた。[p]

    #シエテ
    お！僕だね！レア物だよ〜？[r]
    大事にしてね！[p]
#
    ━すっかり気が抜けてしまった君とシエテは、[r]
    十天衆チョコを開けまくり、[r]
    無事全種コンプリート出来たのであった。[p]

    ～シエテEND～[l]
    [chara_hide name="siete" time="500" wait="true"]
    [jump storage="first.ks" target="*start"]


*soiya_with_them 
    ; [playse storage="select_se.wav"] ; 選択音

    ; 3人組は表示されたまま（またはここで再度表示位置などを調整）
    ; 必要であれば、シエテを再表示して困惑させるセリフを追加しても面白い

    君は彼らと共にソイヤッ！する事にした。[p]

#四羽烏
    ソイヤッ！[p]
   
    ソイヤッ！ソイヤッ！[p]

   
<<<<<<< HEAD
   
=======
    #三羽烏
>>>>>>> bca021b83bf15d2867e70a17abee26686fe9297a
    ソイヤソイヤソイヤソイヤッ！[p]
    [chara_hide name="oigen" time="100" wait="true"]

    ; 全員でソイヤ (ここは地の文や、特別な演出で)
    「ソイヤッサ！」[p]
    [font size="35" bold="true"]
    「「「「ソイヤッ！ソイヤッ！ソイヤッサ！！」」」」[p]
    [resetfont]

    ; シエテ登場（または再登場）
  
    [chara_hide name="oigen" time="100" wait="false"]
    [chara_show name="siete" x="150" y="150" time="500" wait="true"]
    #シエテ
    えぇ...？何...これ...？[p]
    え？コレで終わり！？[r]
    嘘でしょ！？[p]

    ━ソイヤの魅力には誰も抗えない。[p]
    ～ソイヤッ！END～[l]

    [chara_hide name="siete" time="500" wait="true"]
    [jump storage="first.ks" target="*start"] ; 最初のシナリオへ


*scold_them 
    ; [playse storage="select_se.wav"]

    君は彼らにうるさいと注意した。[p]

    ; 3人組が悲しむ演出 (表情差分があれば [chara_mod] で変更)
    ; ここではセリフのみで表現
    ; 必要であれば、[chara_move] などで退場する動きをつけても良い
    
    #オイゲン
    ｿｲﾔｧ...(´；ω；`)[p]
    [chara_hide name="oigen" time="500" wait="true"] 

    肩を落とし船内に戻っていく3人を見送りながら、[r]
    君は静かに待つ。[p]

    ; シエテを表示したままにするか、ここで再表示するか
    [chara_show name="siete" x="150" y="150" time="300" wait="true"] 

    そこに現れたのは...[l]

    ; 次の選択肢
    [glink color="blue" x="70" y="250" width="350" size="24" text="ウィルナス、ルオー" target="*wilnas_luoh_appear"]
    [glink color="blue" x="70" y="320" width="350" size="24" text="ワムデュス、ガレヲン" target="*wamdus_galleon_appear"]
    [s]

; 以下、ウィルナス・ルオー登場ルート、ワムデュス・ガレヲン登場ルート、
; そして「手合わせする」を選んだ場合のルートを記述していきます。
; *wilnas_luoh_appear
; *wamdus_galleon_appear
; *spar_with_siete
;   *dodge_left (避けた後の次の選択肢など)
;   *block_sword
;   *dodge_right

; エンディングの最後には [jump storage="first.ks" target="*start"] でプロローグへ戻る