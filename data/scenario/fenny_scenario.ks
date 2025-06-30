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
    

*start_cross_examination
    [cm]
    ; [playbgm storage="cross_examination_bgm.ogg"] 

    ; ★★★ 論破パートの初期設定 ★★★
    [iscript]
    // 証言リスト (tf変数なのでセーブデータをまたいでも残る)
    tf.testimonies = [
        { id: 1, text: "わ、私じゃありません！" },
        { id: 2, text: "私はあなたと一緒にフェニーちゃんを見守ってたじゃないですか！" },
        { id: 3, text: "フェニーちゃんは黙々とチョコを作ってたのを私も見てます！" }, // これが弱点
        { id: 4, text: "ほら！ちゃんとフェニーちゃんが何してたかも分かります！" }
    ];
    // 揺さぶった時のセリフ
    tf.shake_responses = {
        1: "ま、まだ証言を始めたばかりです！ちゃんと話を聞いてください！",
        2: "フェニーちゃんが何をしてたかって？それはもちろん...！",
        3: "黙々と黙ってたかって...？ええ！そうです！真剣な顔で作ってましたよ！鼻歌一つ歌ってません！",
        4: "だから、私は犯人じゃないんです！信じて下さい！"
    };
    // 証拠品リスト
    f.evidence_list = [
        { id: "singing", name:"フェニーの鼻歌"},
        { id: "choco_mouth", name:"口元のチョコ"},
        { id: "hihiiro_bowl", name:"ヒヒイロボウル"}
    ];
    f.life = 5; // 体力
    [endscript]

    ; --- UIの配置 ---
    [chara_show name="ruria" x="150" y="100"]

    ; 体力表示用のテキストエリア
    [iscript] f.life_text = "体力：" + f.life; [endscript]
    [ptext name="life_gauge" layer="fix" x="350" y="20" size="24" color="white" text="&f.life_text"]

    #ルリア
    そ、そうです！聞いてください！[r]
    これが私のアリバイです！[l]

    ; 証言をまとめて表示
    [font color="yellow"]
    証言１：[emb exp="tf.testimonies[0].text"][r]
    証言２：[emb exp="tf.testimonies[1].text"][r]
    証言３：[emb exp="tf.testimonies[2].text"][r]
    証言４：[emb exp="tf.testimonies[3].text"][l]
    [resetfont]

    # 
    （主人公の心の声）「なるほど…。[r]この証言、どこかに矛盾があるはずだ…」[l]
    [jump target="*main_interrogation_choice"]


*main_interrogation_choice
    ; 体力表示を更新
    [iscript] f.life_text = "体力：" + f.life; [endscript]
    [ptext name="life_gauge" layer="fix" x="350" y="20" size="24" color="white" text="&f.life_text"]

    どうする？[l]

    [glink color="orange" x="70" y="400" width="310" size="28" text="ゆさぶる" target="*select_testimony_for_shake"]
    [glink color="red" x="70" y="470" width="310" size="28" text="つきつける" target="*select_testimony_for_present"]
    [s]

; ----- どの証言を「ゆさぶる」か選択 -----
*select_testimony_for_shake
    #
    （主人公の心の声）「どの発言をゆさぶろうか…」[l]
    ; 証言をglinkボタンとして表示
    [glink text="&tf.testimonies[0].text" x="70" y="250" width="310" size="22" color="cyan" target="*shake_testimony_1"]
    [glink text="&tf.testimonies[1].text" x="70" y="320" width="310" size="22" color="cyan" target="*shake_testimony_2"]
    [glink text="&tf.testimonies[2].text" x="70" y="390" width="310" size="22" color="cyan" target="*shake_testimony_3"]
    [glink text="&tf.testimonies[3].text" x="70" y="460" width="310" size="22" color="cyan" target="*shake_testimony_4"]
    [glink text="やめる" x="70" y="550" width="310" size="22" color="gray" target="*main_interrogation_choice"]
    [s]

*shake_testimony_1
    [eval exp="f.shake_response_text = tf.shake_responses[1]"]
    [jump target="*show_shake_response"]
*shake_testimony_2
    [eval exp="f.shake_response_text = tf.shake_responses[2]"]
    [jump target="*show_shake_response"]
*shake_testimony_3
    [eval exp="f.shake_response_text = tf.shake_responses[3]"]
    [jump target="*show_shake_response"]
*shake_testimony_4
    [eval exp="f.shake_response_text = tf.shake_responses[4]"]
    [jump target="*show_shake_response"]

*show_shake_response 
    ; [playse storage="matta_voice.ogg"]
    #ルリア
    [emb exp="f.shake_response_text"][l]
    [jump target="*main_interrogation_choice"]


; ----- どの証言に「つきつける」か選択 -----
*select_testimony_for_present
    # ; 名前クリア
    （主人公の心の声）「どの発言に証拠品をつきつけようか…」[l]
    [glink text="&tf.testimonies[0].text" x="70" y="250" width="310" size="22" color="cyan" exp="f.target_testimony_id = 1" target="*show_evidence_selection_for_ruria"]
    [glink text="&tf.testimonies[1].text" x="70" y="320" width="310" size="22" color="cyan" exp="f.target_testimony_id = 2" target="*show_evidence_selection_for_ruria"]
    [glink text="&tf.testimonies[2].text" x="70" y="390" width="310" size="22" color="cyan" exp="f.target_testimony_id = 3" target="*show_evidence_selection_for_ruria"]
    [glink text="&tf.testimonies[3].text" x="70" y="460" width="310" size="22" color="cyan" exp="f.target_testimony_id = 4" target="*show_evidence_selection_for_ruria"]
    [glink text="やめる" x="70" y="550" width="310" size="22" color="gray" target="*main_interrogation_choice"]
    [s]

*show_evidence_selection_for_ruria
    # ; 名前クリア
    （主人公の心の声）「どの証拠品を使おうか…」[l]
    ; [playse storage="igiari_voice.ogg"]
    ; 証拠品選択肢をglinkで表示
    [glink text="&f.evidence_list[0].name" x="70" y="250" width="300" size="24" color="green" exp="f.selected_evidence_id = f.evidence_list[0].id" target="*check_evidence_result"]
    [glink text="&f.evidence_list[1].name" x="70" y="320" width="300" size="24" color="green" exp="f.selected_evidence_id = f.evidence_list[1].id" target="*check_evidence_result"]
    [glink text="&f.evidence_list[2].name" x="70" y="390" width="300" size="24" color="green" exp="f.selected_evidence_id = f.evidence_list[2].id" target="*check_evidence_result"]
    [glink text="やめる" x="70" y="480" width="300" size="24" color="gray" target="*main_interrogation_choice"]
    [s]

*check_evidence_result
    [if exp="f.target_testimony_id == 3 && f.selected_evidence_id == 'singing'"]
        ; 正解！
        [jump target="*ruria_breakdown_success"]
    [else]
        ; 不正解
        [eval exp="f.life--"]
        [if exp="f.life <= 0"]
            [jump target="*ruria_investigation_badend"]
        [else]
            #ルリア
            そ、そんなの証拠になりません！[l]
            [jump target="*main_interrogation_choice"]
        [endif]
    [endif]
    [s]

*ruria_breakdown_success
    [cm]
    [clearfix]
    [chara_hide name="ruria"]
    ; [playbgm storage="success_bgm.ogg"]
    [chara_show name="ruria" x="150" y="100"]
    #ルリア
    え...！？フェニーちゃんは[r]
    鼻歌を歌っていた...？[p]
    う、嘘ですよね？[l]

    [chara_hide name="ruria" time="200" wait="true"]
    [chara_show name="sandalphon" x="150" y="150" time="500" wait="true"]
    #サンダルフォン
    間違いないな。[r]
    俺も奥でコーヒーの配合をしてたが、[r]
    あれは間違いなくフェニーだった。[l]
    [chara_hide name="sandalphon" time="200" wait="true"]

    [chara_show name="ruria" x="150" y="100" time="500" wait="true"]
    #ルリア
    そ、そんな...[r]
    ご、ごめんなさい〜！[p]
    美味しそうでつい、[r]
    魔が刺しちゃって...[l]

    [chara_hide name="ruria" time="200" wait="true"]
    [chara_show name="fenny" x="150" y="150"]
    #フェニー
    大丈夫なんだよ！[r]
    こんなこともあろうかと、[r]
    いーーっぱい！チョコは買ってきてあるんだよ！[p]
    さ！気を取り直して一緒に作るんだよ！！[l]
    [chara_hide name="fenny"]

    #
    君は矛盾を指摘できた。[p]
    チョコをもらったサブリナの笑顔、[r]
    チョコをあげたフェニーの笑顔、[r]
    共にかけがえのない宝を守ることができた君は━[l]

    [chara_show name="fenny" x="150" y="150"]
    #フェニー
    はい！団長さんにも！[r]
    ハッピーバレンタインなんだよ！[p]
    [chara_hide name="fenny"]

    #
    無事、チョコを手に入れることができた。[p]
    ～フェニーエンド～[l]
    [jump storage="first.ks" target="*start"]

*ruria_investigation_badend
    [cm]
    [clearfix]
    [chara_hide name="ruria"]
    ; [playbgm storage="bad_end_bgm.ogg"]

    #ルリア
    ほら！何度やっても同じです！[r]
    ね？私は食べていないでしょう？[p]
    チョコは無くなっちゃいましたが...[p]
    美味しかったからしょうがないですよ！[l]

    [chara_hide name="ruria" time="200" wait="true"]
    [chara_show name="fenny" x="150" y="150"]
    #フェニー
    サブリナ...ごめんなんだよ...[l]
    [chara_hide name="fenny"]

    #
    君は矛盾を指摘できなかった。[p]
    チョコもフェニーの笑顔も守れなかった敗北者として、[r]
    君の名は歴史に刻まれた。[p]
    ～バッドエンド～[l]
    [jump storage="first.ks" target="*start"]