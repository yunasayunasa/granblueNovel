; macro.ks
[macro name="update_testimony_display"]
    [iscript]
    // 表示する証言を取得
    var current_testimony = tf.testimonies[f.current_testimony_index];
    var text_to_show = current_testimony.text;
    var is_weakpoint_flag = current_testimony.is_weakpoint;

    // jQueryでptextエリアを特定し、内容を書き換える
    var ptext_area = $(".testimony_area_js");
    if (ptext_area.length > 0) {
        ptext_area.find(".inner_ptext").html(text_to_show);
        ptext_area.data("is_weakpoint", is_weakpoint_flag);
    } else {
        console.warn("証言エリアのセレクタ '.testimony_area_js' が見つかりません。");
    }
    [endscript]
    ; このマクロの中では [s] や [l] は使わない
[endmacro]
; ★★★ 証言テキストエリアを更新するためのマクロ ★★★
[macro name="update_testimony_text"]
    ; iscriptで表示するテキストを準備
    [iscript]
    f.current_text = tf.testimonies[f.current_testimony_index].text;
    f.is_weakpoint_now = tf.testimonies[f.current_testimony_index].is_weakpoint;
    [endscript]

    ; 必須パラメータを全て含めてptextを上書き
    [ptext name="testimony_text" layer="0" x="50" y="300" width="350" height="150" size="28" color="white" text="&f.current_text" overwrite="true" class="testimony_area_js"]

    ; 弱点フラグをHTMLに保存
    [iscript]
    $(".testimony_area_js").data("is_weakpoint", f.is_weakpoint_now);
    [endscript]
[endmacro]

; ★★★ 通常のメッセージウィンドウと名前表示を再設定するためのマクロ ★★★
[macro name="setup_main_message_window"]
    [position layer="message0" left="25" top="600" width="400" height="180" page=fore visible=true]
    [position layer="message0" page=fore margint="25" marginl="25" marginr="25" marginb="25"]
    [ptext name="chara_name_area" layer="message0" color="white" size="20" bold="true" x="40" y="575"]
    [chara_config ptext="chara_name_area"]
[endmacro]

[macro name="draw_debate_ui"]

    ; ★★★ 議論中のUI要素をまとめて描画するマクロ ★★★

    ; 議論相手（ルリア）を表示
    [chara_show name="ruria" x="150" y="100"]

    ; 証言表示用のテキストエリアを定義 (class属性も忘れずに)
    [ptext name="testimony_text" layer="0" x="50" y="300" width="350" height="150" size="28" color="white" class="testimony_area_js" border="line" border_color="red" border_size="2"]

    ; コトダマボタンを配置
    [glink name="kotodama_0" text="&tf.kotodama_list[0].name" x="20" y="650" width="200" size="20" color="green" target="*on_kotodama_0_click"]
    [glink name="kotodama_1" text="&tf.kotodama_list[1].name" x="230" y="650" width="200" size="20" color="green" target="*on_kotodama_1_click"]

    ; 体力表示用のテキストエリアを定義 (議論開始時のみで良いが、再描画用にここにあっても良い)
    [ptext name="life_gauge" layer="fix" x="350" y="20" size="24" color="white" exp="f.life_display_text"]

[endmacro]

; (前回提案した他のマクロ [update_testimony_display] や [setup_main_message_window] もここに記述)