; first.ks (タイトル風シーンを組み込む例)
*start ; ゲーム全体の開始点 (タイトル画面表示へジャンプ)
    
; ★★★ レスポンシブ対応初期化 ★★★
[call storage="resizecall.ks"] 
[set_resizecall storage="resizecall.ks"] 
[call storage="macro.ks"]
    [iscript]
    var tyrano_base_element = document.getElementById('tyrano_base');
    if (tyrano_base_element) {
        tyrano_base_element.style.setProperty('transform', 'scale(1)', 'important');
        tyrano_base_element.style.setProperty('transform-origin', '0px 0px', 'important');
        console.log("#tyrano_base の transform を script で scale(1) に設定試行");
    } else {
        console.error("#tyrano_base が見つかりません");
    }
    [endscript]
    [jump target="*show_title_screen"]

*show_title_screen
    [cm]
    [clearfix]
    @layopt layer=message0 visible=false ; メッセージウィンドウを非表示
    [stopbgm]

    ; [playbgm storage="title_theme.ogg" loop="true"] ; タイトルBGM (後で)

    ; 背景なし (黒背景のまま) または単色背景を指定する場合
    ; [bg color="0x333333" time="0"] ; 暗いグレー背景の例

    ; タイトルテキスト表示 (画面中央あたりに大きく)
    [mtext text="演算世界とチヨコレイト" x="50" y="150" size="36" color="white" time="500" align="center" width="350"]
    ; width と align="center" で中央揃えを試みる (xは左端からの位置なので注意)
    ; もっと確実に中央揃えしたい場合は、xを計算するか、CSSで調整

    ; 「はじめから」ボタン (glinkを使用)
    ; x, y, width, size は Config.tjs の 450x800 画面に合わせて調整
    [glink text="はじめから" x="125" y="400" width="200" size="28" color="blue" target="*start_prologue" name="start_button"]

    ; 「つづきから」ボタン (glinkを使用)
    [glink text="つづきから" x="125" y="480" width="200" size="28" color="green" target="*load_game_from_title" name="load_button"]

    [s]

*start_prologue
    ; [playse storage="select_se.wav"] ; 開始音 (後で)
    [cm]
    @layopt layer=message0 visible=true ; メッセージウィンドウを表示
    ; [freeimage layer="1"] ; ロゴを表示していたら消す (今回は未使用)


; ★★★ 画面クリアと主要要素の再設定 ★★★
[cm]
[clearfix]
[stopbgm]
[stopse]

; ★★★ 意図的な画面更新処理 ★★★
; 方法1: TyranoScriptの内部的な画面リフレッシュを試みる (もしあれば)
; [refresh_screen] ; ← このようなタグがあれば (架空のタグです)

; 方法2: 短いウェイトの後に、何らかの描画関連のダミータグを実行
[wait time="100"] 
[bg storage="calc_space.jpg" time="0" ] 
; または、前景レイヤーの表示/非表示などでも良いかもしれません
; [layopt layer="0" visible=false]
; [layopt layer="0" visible=true]

; 方法3: JavaScriptでリサイズイベントを疑似的に発火 (ブラウザやTyranoScriptが反応するかは不明)
[iscript]
// TyranoScriptのエンジンがリサイズイベントをリッスンしていることを期待
window.dispatchEvent(new Event('resize'));
console.log("Resize event dispatched.");
// さらに TyranoScript 内部のリサイズ関数を直接呼び出すことを試みる (非常に高度で危険)
// if (TYRANO && TYRANO.kag && TYRANO.kag.event && TYRANO.kag.event.resizeEvent) {
//     TYRANO.kag.event.resizeEvent();
//     console.log("TYRANO.kag.event.resizeEvent() called.");
// }
[endscript]
[wait time="100"] 

; ★★★ プロローグの初期要素を再描画 ★★★
[playbgm storage="prologue_bgm.ogg" loop="true"]
[bg storage="calc_space.jpg" time="1000"] 

; メッセージウィンドウの位置とサイズを再設定
[position layer="message0" left="25" top="600" width="400" height="180" page=fore visible=true]
[position layer="message0" page=fore margint="25" marginl="25" marginr="25" marginb="25"]

; キャラクター名表示エリアをクリアして再設定
[ptext name="chara_name_area" layer="message0" x="40" y="605" text="" visible="false"]
[chara_config ptext="chara_name_area"]

; キャラクター定義
[chara_new name="roger" storage="roger_normal.png" jname="ロジャー"]

[popopo type=sine frequency=A octave=0]

[title name="演算世界とチヨコレイト"]
[bg storage="calc_space.jpg" time="1000"]





君は、見たこともない空間にいる。[r]幻想的な一面の花畑、[r]とても現実とは思えない。[p]

[chara_show name="roger" x="200" y="150"]
; ★★★ ロジャーの名前を表示するために ptext を再設定 ★★★
[ptext name="chara_name_area" layer="message0" color="white" size="20" bold="true" x="40" y="605" text="&sf._system_config_chara_ptext_first_name || ''" visible="true"]
; [chara_config ptext="chara_name_area"] ← これは[ptext]定義の直後に一度で良い場合が多い

#ロジャー
おはよう！お呼びとあらば即参上できない！[r]
今日も今日とて限界勤務上等の[r]
オロロジャイアちゃんでっす！[p]

ｵﾎﾝｴﾍﾝ...!ここは演算世界。[r]
僕の力で作り出された世界。[r]
あらゆる可能性を探るための場所さ。[p]

これから君には僕と一緒に[r]
旅をしてもらいたいんだ。[p]
そう！君がチョコをもらえる世界を[r]
探り出す為に！[p]
そんな訳で早速行ってみよう〜！[r]
と言っても...僕は一緒に行ける訳ではないんだけどね！[r]
社畜の悲しみ！[p]
代わりにガチャ回させてあげるから許して！[p]
はい！10連ガチャガチャっとね！[p]

; ロジャー退場
[chara_hide name="roger" time="500" wait="true"]

; ガチャ演出 (今は省略、SEや簡単なアニメーションを入れることも可能)
[clearname]
#
1人の仲間が目の前に現れる。[p]



#？？？
それじゃあ、団長ちゃん、一緒に行こっか♪[p]

; first.ks の選択肢部分 (glinkバージョン)

; ... (前の行まで) ...
仲間になったのは...[l]

; 選択肢 (glinkを使用)
; x, y, width, size は縦画面のレイアウトに合わせて調整してください
[glink color="blue" x="70" y="250" width="200" size="28" text="ナルメア" target="*narumia_route_start"]
[glink color="blue" x="70" y="350" width="200" size="28" text="シエテ" target="*siete_route_start"]
[glink color="blue" x="70" y="450" width="200" size="28" text="誰も仲間にしない" target="*hard_mode_start"]
[s]


; ----- 各ルートへの分岐先ラベル (これらは別の .ks ファイルに分けても良い) -----
*narumia_route_start
 
  [chara_new name="narumia" storage="narumia_normal.png" jname="ナルメア"] 
  [chara_show name="narumia" time="500" wait="true"]
  #ナルメア
  よろしくね、団長ちゃん！[p]
 #
  [jump storage="narumia_scenario.ks" target="*cafe_scene"]


*siete_route_start
    ; シエテが仲間になる処理
    ; [chara_hide name="silhouette" time="100" wait="true"]
    [chara_new name="siete" storage="siete_normal.png" jname="シエテ"] 
    [chara_show name="siete" x="150" y="150" time="500" wait="true"]
    #シエテ
    やあ、団長ちゃん。俺と行くのかい？[p] 
   #
    [jump storage="siete_scenario.ks" target="*deck_scene_start"] 
*hard_mode_start
  ; 誰も仲間にしない処理
  ; ...
  [jump storage="hard_scenario.ks" target="*auguste_scene"]

*load_game_from_title
    ; [playse storage="select_se.wav"]
    [cm]
    [showload]
    ; ロード後、タイトルに戻るか、ゲーム再開かは showload の挙動次第
    ; 通常はゲーム再開される。キャンセル時はタイトルに戻したい。
    ; TyranoScriptのバージョンによって showload の戻り値や分岐方法が異なる場合がある。
    ; 最もシンプルなのは、ロード画面を抜けたら必ずタイトルに戻るようにすること。
    [jump target="*show_title_screen"]
[s] ; showloadの後には[s]が必要な場合が多い
; ----- 説明表示用ラベル (任意) -----
*show_narumia_desc
  [mtext text="【ナルメア】\nイージーモード。３つのエンディングが存在します。\nまずはここから始めることをお勧めします" size="20" x="300" y="200" time="500"]
  [wait time=3000] // 3秒待つ
  [mtext_hide time="500"]
  [jump target="*start"] // 選択肢に戻る (または元の場所を記憶して戻る)


; このファイルはここで終わり (各ルートは別ファイルにジャンプする想定)
; もし同じファイルに続けるなら @endjump は不要