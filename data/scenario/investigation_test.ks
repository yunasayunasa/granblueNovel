; investigation_test.ks

*start_investigation

; ----- 初期設定とキャラクター定義 -----
[cm]
[clearfix]
[bg storage="interrogation_room.jpg" time="500"] ; 仮の尋問室背景

; キャラクター定義
[chara_new name="roger" storage="roger_normal.png" jname="ロジャー"]

; メッセージウィンドウと名前表示エリアの設定 (first.ksからコピーなどして調整)
[position layer="message0" left="25" top="600" width="400" height="180" page=fore visible=true]
[position layer="message0" page=fore margint="25" marginl="25" marginr="25" marginb="25"]
[ptext name="chara_name_area" layer="message0" color="white" size="20" bold="true" x="40" y="575" visible="false"]
[chara_config ptext="chara_name_area"]

; ★★★ 証拠品の初期化 (テスト用) ★★★
[iscript]
// f.evidence_list が未定義なら初期化
if (typeof f.evidence_list === 'undefined') {
    f.evidence_list = [];
}
// テスト用の証拠品を追加 (実際はイベントで入手)
f.evidence_list = [
    {id: "photo", name:"現場の写真", desc:"事件現場近くで見つかった風景写真。何か写っているようだ。"},
    {id: "notebook", name:"古い手帳", desc:"被害者のものと思われる古い手帳。内容は解読困難。"},
    {id: "knife", name:"果物ナイフ", desc:"キッチンにあった普通の果物ナイフ。"}
];
// 現在注目している発言ID (仮)
f.target_statement_id = "alibi_statement";
[endscript]


; ----- 尋問開始 -----
[chara_show name="roger" x="200" y="150"]
#怪しい男
私は無実だ！[r]
あの日、あの時間、私はここからずっと離れた場所にいたんだ！[p]
完璧なアリバイがある！[l]

# ; 名前表示クリア
（主人公の心の声）「あの発言…なんだか引っかかるな…」[l]
（主人公の心の声）「証拠品をつきつけてみるか？」[l]

; 「つきつける」アクションの選択
[glink text="証拠品をつきつける" x="125" y="500" width="200" size="24" color="orange" target="*show_evidence_selection"]
[glink text="今はやめておく" x="125" y="560" width="200" size="24" color="gray" target="*investigation_continue_later"] ; 今回はこのルートは作り込まない
[s]


*show_evidence_selection
    [cm] ; メッセージウィンドウをクリア
    ; [chara_hide name="suspect"]
    # ; 名前表示クリア
    （主人公の心の声）「どの証拠品を使おうか…」[l]

    ; ★★★ 証拠品選択肢の動的生成 ★★★
    [iscript]
    // 証拠品リストからglinkタグを生成する
    // y座標の初期値
    var y_pos = 200;
    // 選択肢ボタンの基本設定
    var glink_x = 70;
    var glink_width = 300;
    var glink_size = 22;
    var glink_color = "green";

    for (var i = 0; i < f.evidence_list.length; i++) {
        var evidence = f.evidence_list[i];
        // 各証拠品に対してglinkタグを動的に生成し、実行する
        // targetには、選択された証拠品のIDを渡すための処理を行うラベルを指定
        var pm = {
            text: evidence.name, // ボタンのテキスト
            x: glink_x,
            y: y_pos,
            width: glink_width,
            size: glink_size,
            color: glink_color,
            storage: "investigation_test.ks", // 現在のシナリオファイル
            target: "*evidence_selected",      // 選択処理用共通ラベル
            // ★★★ 選択された証拠品のIDをゲーム変数に格納する処理を挟む ★★★
            exp: "f.selected_evidence_id = '" + evidence.id + "'" // ← これが重要！
        };
        TYRANO.kag.ftag.startTag("glink", pm);
        TYRANO.kag.ftag.startTag("r"); // 改行
        y_pos += 60; // 次のボタンのy座標
    }
    [endscript]
    [s] ; 証拠品選択を待つ

*evidence_selected
    ; [playse storage="select_se.wav"]
    ; [iscript] alert("選択された証拠ID: " + f.selected_evidence_id); [endscript]

    ; ★★★ つきつけ処理と判定 ★★★
    ; [chara_show name="suspect" x="150" y="150"] ; 相手を再表示

    [if exp="f.target_statement_id == 'alibi_statement' && f.selected_evidence_id == 'photo'"]
        ; 正解の証拠品
        # ; 名前表示クリア
        （主人公の心の声）「これだ！」[l]
        #怪しい男
        な、なんだその写真は！？[r]
        そ、そんなものがなぜ…！[p]
        [chara_mod name="suspect" face="sweat"] ; 表情変更 (もしあれば)
        うぐぐ…[l]
        [jump target="*investigation_success"]
    [else]
        ; 不正解の証拠品
        # ; 名前表示クリア
        （主人公の心の声）「これじゃないのか…？」[l]
        #怪しい男
        ふん、そんなもので私のアリバイが崩せるとでも？[r]
        くだらないな。[l]
        [jump target="*investigation_fail"]
    [endif]
    [s] ; if文の後には[s]が必要な場合がある

*investigation_success
    [cm]
    [bg storage="interrogation_room_success.jpg" time="500"] 
    やった！矛盾を指摘できた！[l]
    [jump storage="first.ks" target="*start"] 

*investigation_fail
    [cm]
    [bg storage="interrogation_room_fail.jpg" time="500"] 
    くっ…間違えたようだ。[l]
    [jump storage="first.ks" target="*start"] 

*investigation_continue_later
    [cm]
    また後で考えることにした。[l]
    [jump storage="first.ks" target="*start"] 