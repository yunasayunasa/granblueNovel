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
 ; 証言表示用のテキストエリアを最初に一度だけ定義
    [ptext name="testimony_text" layer="0" x="50" y="300" width="350" height="150" size="24" color="white"]
    ; ★★★ 論破パートの初期設定 ★★★
    [iscript]
    // 証言リスト
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
        3: "黙々と黙ってたかって...？ええ！そうです！真剣な顔で作ってましたよ！鼻歌一つ歌ってません！", // 矛盾！
        4: "だから、私は犯人じゃないんです！信じて下さい！"
    };
    // 証拠品リスト
    f.evidence_list = [
        { id: "singing", name:"フェニーの鼻歌", desc:"楽しそうに歌っていた"}, // 正解の証拠品
        { id: "choco_mouth", name:"口元のチョコ", desc:"ルリアの口元にチョコが...？"},
        { id: "hihiiro_bowl", name:"ヒヒイロボウル", desc:"ハウヘトおすすめの高級品"}
    ];
    // 初期状態
    f.current_testimony_index = 0; // 現在の証言インデックス
    f.life = 5; // 体力
    f.life_text = "体力：" + f.life; // iscript内で先にテキストを結合しておく
    [endscript]

    [endscript]

     ; --- UIの配置 ---
    [chara_show name="ruria" x="150" y="100"]

    [ptext name="life_gauge" layer="fix" x="350" y="20" size="24" color="white" text="体力：&f.life"]
    [ptext name="testimony_text" layer="0" x="50" y="300" width="350" height="150" size="24" color="white" class="testimony_area_js"]

    ; ★★★ 操作ボタンを [glink] に変更 ★★★
    [glink graphic="angry.png" x="50" y="500" target="*prev_testimony" name="prev_btn"]
    [glink graphic="angry.png" x="150" y="500" target="*next_testimony"  name="next_btn"]
    [glink graphic="angry.png" x="250" y="500" target="*shake_testimony"  name="shake_btn"]
    [glink graphic="angry.png" x="350" y="500" target="*present_evidence" name="present_btn"]

    ; ★★★ 操作説明 ([ptext] と [free] を使用) ★★★
    [ptext name="instruction_text" layer="fix" x="25" y="600" width="400" size="18" color="white" text="証言を移動し、揺さぶって情報を引き出すか、証拠品を突きつけて矛盾を指摘しよう。"]

    [wait time="3000"]

    ; ★★★ [free] の代わりに [ptext] で内容を空にして非表示にする ★★★
    [ptext name="instruction_text" layer="fix" x="25" y="600" text="" visible="false"]

    ; [wait time="100"]

    ; 最初の証言を表示して開始
    [jump target="*display_current_testimony"]
    [s]

*display_current_testimony
    [iscript]
    // 表示する証言のテキストだけを変数にセット
    f.current_text = tf.testimonies[f.current_testimony_index].text;
    [endscript]

    ; ★★★ 必須パラメータを追加してテキストを上書き ★★★
    [ptext name="testimony_text" layer="0" x="50" y="300" width="350" height="150" size="24" color="white" text="&f.current_text" overwrite="true"]

    ; ★★★ 弱点フラグの保存 (iscript) ★★★
    [iscript]
    var is_weakpoint_flag = tf.testimonies[f.current_testimony_index].is_weakpoint;
    $(".tyrano_ptext[data-name='testimony_text']").data("is_weakpoint", is_weakpoint_flag);
    [endscript]
    [s] 

*next_testimony
    [iscript] f.current_testimony_index = (f.current_testimony_index + 1) % tf.testimonies.length; [endscript]
    [jump target="*display_current_testimony"]

*prev_testimony
    [iscript]
    f.current_testimony_index--;
    if (f.current_testimony_index < 0) { f.current_testimony_index = tf.testimonies.length - 1; }
    [endscript]
    [jump target="*display_current_testimony"]


*shake_testimony
    ; ★★★ 「待った！」演出 ★★★
    ; [playse storage="matta_voice.ogg"]
    ; [image storage="matta_effect.png" layer="1" time="100" wait="false"] [wait time=500] [freeimage layer=1]

    [iscript]
    var testimony_id = f.current_testimony.id;
    f.shake_response_text = tf.shake_responses[testimony_id];
    [endscript]
    #ルリア
    &f.shake_response_text;[l]
    [jump target="*next_testimony"] 

*present_evidence
    ; ★★★ 「異議あり！」演出 ★★★
    ; [playse storage="igiari_voice.ogg"]
    ; [image storage="igiari_effect.png" layer="1" time="100" wait="false"] [wait time=500] [freeimage layer=1]

    ; 証拠品選択画面へ
    [jump storage="investigation_test.ks" target="*show_evidence_selection_for_ruria"] ; 証拠品選択用の新しいラベルへ

; ----- 証拠品選択と判定（証拠品つきつけプロトタイプを流用） -----
*show_evidence_selection_for_ruria
    [cm]
    （主人公の心の声）「どの証拠品を突きつけようか…」[l]

    ; 証拠品選択肢の動的生成 (プロトタイプと同じロジック)
    [iscript]
    var y_pos = 200;
    for (var i = 0; i < f.evidence_list.length; i++) {
        var evidence = f.evidence_list[i];
        var pm = { text: evidence.name, x: 70, y: y_pos, width: 300, size: 24, color: "green",
                   storage: "fenny_scenario.ks", target: "*ruria_evidence_selected",
                   exp: "f.selected_evidence_id = '" + evidence.id + "'" };
        TYRANO.kag.ftag.startTag("glink", pm);
        TYRANO.kag.ftag.startTag("r");
        y_pos += 70;
    }
    [endscript]
    ; ★★★ 戻るボタンも追加 ★★★
    [glink text="戻る" x="70" y="&y_pos" width="300" size="24" color="gray" target="*start_cross_examination" name="back_button"]
    [s]

*ruria_evidence_selecte
    ; ★★★ iscript内で判定まで完結させる ★★★
    [iscript]
    var is_correct = false;
    // f.current_testimony は *display_current_testimony の iscript でセットされるはず
    // ただし、tf変数かもしれないので、tf.current_testimony も確認
    var testimony_obj = f.current_testimony || tf.current_testimony; // fかtfのどちらかにあるはず
    if (testimony_obj && testimony_obj.id == 3 && f.selected_evidence_id == 'singing') {
        is_correct = true;
    }
    f.is_correct_evidence = is_correct;
    [endscript]

    [if exp="f.is_correct_evidence == true"]
        [jump target="*ruria_breakdown_success"]
    [else]
        ; ★★★ [eval] を [iscript] に変更 ★★★
        [iscript]
        f.life--; // または f.life = f.life - 1;
        // 体力表示用のテキストもここで更新
        f.life_text = "体力：" + f.life;
        [endscript]

        ; 体力表示を更新
        [ptext name="life_gauge" layer="fix" x="350" y="20" size="24" color="white" text="&f.life_text"]

        #ルリア
        そ、そんなの証拠になりません！[p]
        もう一回言いますよ！[l]

        [if exp="f.life <= 0"]
            [jump target="*ruria_investigation_badend"]
        [else]
            [jump target="*display_current_testimony"]
        [endif]
    [endif]
    [s]

*ruria_breakdown_success ; 成功ルート
    ; ... (台本の成功ルートのテキストをここに記述) ...
    #ルリア
    そ、そんな...[r]
    ご、ごめんなさい〜！[l]
    ; ...
    ～フェニーエンド～[l]
    [jump storage="first.ks" target="*start"]

*ruria_investigation_badend ; 体力ゼロのBAD END
    ; ... (台本の「君は矛盾を指摘できなかった。」のテキストを記述) ...
    ～バッドエンド～[l]
    [jump storage="first.ks" target="*start"]