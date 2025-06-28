; fenny_scenario.ks

*port_breeze_arrival
    ; フェニーは表示されている状態
    [bg storage="port_breeze_bg.jpg" time="1000"] 
    君は、フェニーと共にとりま突発で[r]
    ポートブリーズに向かうことにした。[p]

; ----- キャラクター定義 (このファイルで使うキャラ) -----
[chara_new name="hauhet" storage="hauhet_normal.png" jname="ハウヘト"]
[chara_new name="sabrina" storage="sabrina_normal.png" jname="サブリナ"]
[chara_new name="ruria" storage="ruria_normal.png" jname="ルリア"]
[chara_new name="sandalphon" storage="sandalphon_normal.png" jname="サンダルフォン"]

    #フェニー
    サブリナにチョコを渡したくて、[r]
    その為の器材や材料が買いたいんだよ！[p]
    どっちを先に買いに行ったほうがいいかな？[l]

    ; 選択肢
    [glink color="blue"   text="器材を買いに行く" target="*buy_equipment_route"]
    [glink color="blue"   text="材料を買いに行く" target="*buy_ingredients_route"]
    [s]


; ----- 材料ルート -----
*buy_ingredients_route
    [chara_hide name="fenny" time="200" wait="true"]
    [bg storage="shop_bg.jpg" time="1000"] 
    [chara_show name="sabrina" x="150" y="150"] 
    #サブリナ
    お、フェニー！団長と買い物？[p]
    [chara_hide name="sabrina" time="200" wait="true"]

    [chara_show name="fenny" x="150" y="150"] 
    #フェニー
    ま、まずいんだよ！[r]
    サブリナにチョコを渡す計画がバレちゃうんだよ！[p]
    団長さん！なんとかしてぇ！[p]
    [chara_hide name="fenny" time="200" wait="true"]

    [chara_show name="sabrina" x="150" y="150"]
    #サブリナ
    なーにをこそこそと相談してるんだい？[r]
    聞かせなさい！[p]

    このままでは計画がバレてしまう...[l]
    君は...[l]

    ; 選択肢
    [glink color="blue"  size="24" text="ごまかす！" target="*ingredients_deceive"]
    [glink color="blue"  size="24" text="フェニーにまかせる！" target="*ingredients_leave_to_fenny_badend"]
    [s]

*ingredients_leave_to_fenny_badend
    [chara_hide name="sabrina" time="200" wait="true"]
    [chara_show name="fenny" x="150" y="150"]
    #フェニー
    ふぇぇ！なんとかして欲しいのは[r]
    フェニーの方なんだよ！？[p]
    で、でも、団長さんがいうなら、[r]
    なんとかしてみるんだよ！[p]
    [chara_hide name="fenny" time="200" wait="true"]

    [chara_show name="sabrina" x="150" y="150"]
    #サブリナ
    何か悩みがあるならなんでも言って。[r]
    ようやく一緒にいられるんだから...[p]
    [chara_hide name="sabrina" time="200" wait="true"]

    [chara_show name="fenny" x="150" y="150"]
    #フェニー
    サブリナ！[r]
    実はその...団長さんとデート中なんだよ！[p]
    [chara_hide name="fenny" time="200" wait="true"]

    [chara_show name="sabrina" x="150" y="150"]
    #サブリナ
    は！？[p]
    [chara_hide name="sabrina" time="200" wait="true"]

    [chara_show name="fenny" x="150" y="150"]
    #フェニー
    だから...その...邪魔しないで欲しいんだよ！！！[p]
    [chara_hide name="fenny" time="200" wait="true"]

    [chara_show name="sabrina" x="150" y="150"]
    #サブリナ
    団長...。どういうこと？[r]
    ちょっとあっちで"お話"しようか...[p]
    [chara_hide name="sabrina" time="200" wait="true"]

    [chara_show name="fenny" x="150" y="150"]
    #フェニー
    あ、、あれ？なんか不穏なんだよ...？[p]
    [chara_hide name="fenny" time="200" wait="true"]
#
    その後、君の行方を知るものは誰もいなかった...[p]
    ～バッドエンド～[l]
    [jump storage="first.ks" target="*start"] 

*ingredients_deceive
[chara_hide name="sabrina" time="200" wait="true"]
    [bg storage="cafe_bg.jpg" time="1000"] 
    なんとかサブリナをごまかし、[r]
    退散することができた君たちは、[r]
    カフェのキッチンでチョコの制作に取り掛かった。[p]

    [chara_show name="fenny" x="150" y="150"]
    #フェニー
    〜♪〜♪サブリナ喜んでくれるかなぁ？[p]
#
    金色に輝くボウルを混ぜながら、チョコを作るフェニー。[p]
    見守っていると、自然と口元が綻んでくる。[p]
    すると...[p]

    #フェニー
    ああーーーーー！！！[r]
    チョコが、チョコがなくなってるんだよ！！？[p]
    [chara_hide name="fenny" time="200" wait="true"]

    [chara_show name="ruria" x="150" y="150"]
    #ルリア
    え、ええーーー！！[r]
    ソ、ソンナ、イッタイダレガー！[p]
#
    あからさまに動揺しているルリア。[r]
    まさかこれは...[p]
    [chara_hide name="ruria" time="200" wait="true"]

    [chara_show name="fenny" x="150" y="150"]
    #フェニー
    ...ルリア？ルリアなんだよ？[p]
    [chara_hide name="fenny" time="200" wait="true"]

    [chara_show name="ruria" x="150" y="150"]
    #ルリア
    ち、違います！[r]
    私じゃありません！話を聞いて下さい！[p]
#
    どうやら証言を聞く必要があるようだ。[p]
    君はルリアの証言を聞くことにした。[l]

    ; ★★★ ノンストップ議論パートへジャンプ ★★★
    [jump storage="nonstop_debate_test.ks" target="*start_debate"]


; ----- 器材ルート -----
*buy_equipment_route
    [chara_hide name="fenny" time="200" wait="true"]
    [bg storage="shop_bg.jpg" time="1000"]
    君は先に器材を買いに行くことにした。[p]

    [chara_show name="hauhet" x="150" y="150"]
    #ハウヘト
    あら...特異点。あなたも買い物？[p]
    [chara_hide name="hauhet" time="200" wait="true"]

    [chara_show name="fenny" x="150" y="150"]
    #フェニー
    ハウヘト！ハウヘトも買い物なんだよ？[p]
    [chara_hide name="fenny" time="200" wait="true"]

    [chara_show name="hauhet" x="150" y="150"]
    #ハウヘト
    えぇ、ここの店はポートブリーズでも特に質が良いの。[p]
    この店にはよく来るから、[r]
    何か聞きたいことがあれば[r]
    アドバイスできると思うわよ？[p]
    [chara_hide name="hauhet" time="200" wait="true"]

    [chara_show name="fenny" x="150" y="150"]
    #フェニー
    団長さん！[r]
    ハウヘトなら色々目利きが効くかもなんだよ！[p]
    買い物のアドバイスしてもらおう？[l]
#
    ; 選択肢
    [glink color="blue"  size="24" text="受ける" target="*equipment_ask_hauhet_end"]
    [glink color="blue"   size="24" text="受けない" target="*equipment_decline"]
    [s]

*equipment_ask_hauhet_end
    [chara_hide name="fenny" time="200" wait="true"]
    [chara_show name="hauhet" x="150" y="150"]
    #ハウヘト
    チョコを手作りするのね。[p]
    そうね、ならやはりボウルとヘラは妥協出来ないわ。[p]
熱伝導効率を最大に高めるためにはこのヒヒイロボウル！[r]
これは良いものよ...。[p]
ヒヒイロカネはその希少性から市場にほぼ出回ることはないわ[r]
だからこそそれを贅沢に使ったこのヒヒイロボウルはそんじょそこらの金属製ボウルとはまた違った
圧倒的な熱伝導効率でチョコを溶かすことができるの[p]
そしてこのダマスカスヘラは4凸済み！これこそが一流の仕事これこそが...[p]
    [chara_hide name="hauhet" time="200" wait="true"]
    [chara_show name="fenny" x="150" y="150"]
    #フェニー
    なんか...すっごい早口で[r]
    何言ってるか全然わかんないんだよ...[p]
    [chara_hide name="fenny" time="200" wait="true"]
#
    その後閉店時間まで延々と[r]
    ハウヘトの講釈を聞く羽目になった...[p]
    チョコ作りは当然間に合わなかった。[p]
    ～ハウヘトEND～[l]
    [jump storage="first.ks" target="*start"]

*equipment_decline
    [bg storage="cafe_bg.jpg" time="1000"]
    買い物を終えた君たちは、[r]
    船内のカフェのキッチンでチョコを作り始めた。[p]

    [chara_show name="fenny" x="150" y="150"]
    #フェニー
    〜♪〜♪サブリナ、喜んでくれるかなあ？[p]
#
    鼻歌を歌いながら楽しそうにチョコを作るフェニー。[p]
    見ているこちらも顔が綻んでくる。[p]
    すると...[p]

    #フェニー
    ああーーーーー！！！[r]
    チョコが、チョコがなくなってるんだよ！！？[p]
    [chara_hide name="fenny" time="200" wait="true"]

    [chara_show name="ruria" x="150" y="150"]
    #ルリア
    ええーーーー！！[r]
    ソ、ソンナ...イッタイダレガー...[p]
#
    一緒に見守っていたはずのルリアが[r]
    明らかに動揺している...[p]
    これは...[p]
    [chara_hide name="ruria" time="200" wait="true"]

    [chara_show name="fenny" x="150" y="150"]
    #フェニー
    ...ルリア？ルリアなんだよ？[p]
    [chara_hide name="fenny" time="200" wait="true"]

    [chara_show name="ruria" x="150" y="150"]
    #ルリア
    ち、違います！私じゃありません！[r]
    アリバイだってあります！[p]
    それに！しょ、証拠がありません！[p]
#
    どうやらシラを切るつもりらしい。[p]
    このままでは埒が開かない。[p]
    君はルリアの証言を聞くことにした。[l]

    ; ★★★ 逆転裁判パートへジャンプ ★★★
    


; ... (*equipment_decline ラベルの「君はルリアの証言を聞くことにした。[l]」まで) ...

*start_cross_examination_simple 
    [cm]
    ; [playbgm storage="cross_examination_bgm.ogg"]

    ; ★★★ 論破パートの初期設定 ★★★
    [iscript]
    // 証拠品リスト (このパートで必要なもの)
    f.evidence_list = [
        { id: "singing", name:"フェニーの鼻歌"},
        { id: "choco_mouth", name:"口元のチョコ"},
        { id: "hihiiro_bowl", name:"ヒヒイロボウル"}
    ];
    f.life = 5; // 体力
    [endscript]

    ; --- UIと証言の提示 ---
    [chara_show name="ruria" x="150" y="100"]
    [ptext name="life_gauge" layer="fix" x="350" y="20" size="24" color="white" text="体力：&f.life"]

    #ルリア
    そ、そうです！聞いてください！[p]
    これが私のアリバイです！[l]

    ; 証言を順番に表示
    [font color="yellow"] ; 証言テキストの色を変えるなど
    証言１：わ、私じゃありません！[p]
    証言２：私はあなたと一緒に[r]フェニーちゃんを見守ってたじゃないですか！[p]
    証言３：フェニーちゃんは黙々とチョコを作ってたのを[r]私も見てます！[p]
    証言４：ほら！ちゃんとフェニーちゃんが[r]何してたかも分かります！[l]
    [resetfont]

    # 
「なるほど…。[r]この証言、どこかに矛盾があるはずだ…」[l]

; ★★★ ここからデバッグ用のシンプルなコードに置き換え ★★★

*main_interrogation_choice
    どうする？[l]
    [glink text="ゆさぶる" target="*shake_all_testimonies"]
    [glink text="テストボタン２" target="*test2"]
    [s]

*test1
    テスト１が選ばれました[l]
    [jump target="*main_interrogation_choice"]

*test2
    テスト２が選ばれました[l]
    [jump target="*main_interrogation_choice"]


*shake_all_testimonies 
    ; [playse storage="matta_voice.ogg"]
    # 
    「待った！もう少し詳しく聞かせてもらおうか！」[l]

    #ルリア
    ま、まだ証言を始めたばかりです！[r]ちゃんと話を聞いてください！[p]
    フェニーちゃんが何をしてたかって？[r]それはもちろん...！[p]
    黙々と黙ってたかって...？[r]ええ！そうです！[r]真剣な顔で作ってましたよ！[r]鼻歌一つ歌ってません！[p]
    だから、私は犯人じゃないんです！[r]信じて下さい！[l]

    ; 揺さぶった後は、再度選択肢に戻る
    [jump target="*main_interrogation_choice"]

*present_evidence_simple 
    ; [playse storage="igiari_voice.ogg"]
    （主人公の心の声）「異議あり！その証言、[r]この証拠品と矛盾する！」[l]

    ; 証拠品選択画面
    （主人公の心の声）「どの証拠品を突きつけようか…」[l]
    [iscript]
    var y_pos = 200;
    for (var i = 0; i < f.evidence_list.length; i++) {
        var evidence = f.evidence_list[i];
        var pm = { text: evidence.name, x: 70, y: y_pos, width: 300, size: 24, color: "green",
                   storage: "fenny_scenario.ks", target: "*check_evidence_result",
                   exp: "f.selected_evidence_id = '" + evidence.id + "'" };
        TYRANO.kag.ftag.startTag("glink", pm);
        y_pos += 70;
    }
    [endscript]
    [glink text="戻る" x="70" y="&y_pos" width="300" size="24" color="gray" target="*main_interrogation_choice"]
    [s]

*check_evidence_result 
    ; [playse storage="select_se.wav"]
    [if exp="f.selected_evidence_id == 'singing'"]
        ; 正解の証拠品！
        [jump target="*ruria_breakdown_success_simple"]
    [else]
        ; 不正解の証拠品
        [eval exp="f.life--"]
        [if exp="f.life <= 0"]
            [jump target="*ruria_investigation_badend"]
        [else]
            #ルリア
            そ、そんなの証拠になりません！[l]
            [jump target="*main_interrogation_choice"] ; 選択肢に戻る
        [endif]
    [endif]
    [s]

*ruria_breakdown_success_simple 
    [cm]
    ; [playbgm storage="success_bgm.ogg"]
    #ルリア
    え...！？フェニーちゃんは[r]鼻歌を歌っていた...？[p]
    う、嘘ですよね？[l]

    ; サンダルフォン登場
    [chara_hide name="ruria" time="200" wait="true"]
    [chara_show name="sandalphon" x="150" y="150" time="500" wait="true"]
    #サンダルフォン
    間違いないな。[r]
    俺も奥でコーヒーの配合をしてたが、[r]
    あれは間違いなくフェニーだった。[l]
    [chara_hide name="sandalphon" time="200" wait="true"]

    [chara_show name="ruria" x="150" y="150" time="500" wait="true"]
    #ルリア
    そ、そんな...[r]
    ご、ごめんなさい〜！[p]
    美味しそうでつい、[r]
    魔が刺しちゃって...[l]

    ; ... (台本の成功ルートの残りのテキストとフェニーエンドへ続く) ...
    ; ...
    ～フェニーエンド～[l]
    [chara_hide name="ruria"]
    [jump storage="first.ks" target="*start"]

*ruria_investigation_badend ; 体力ゼロのBAD END
    [cm]
    [chara_hide name="ruria"]
    ; ... (台本の「君は矛盾を指摘できなかった。」のテキストを記述) ...
    ～バッドエンド～[l]
    [jump storage="first.ks" target="*start"]