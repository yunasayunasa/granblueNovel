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