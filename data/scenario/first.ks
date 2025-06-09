*start
[iscript]
var tyrano_base_element = document.getElementById('tyrano_base');
if (tyrano_base_element) {
    tyrano_base_element.style.setProperty('transform', 'scale(1)', 'important');
    tyrano_base_element.style.setProperty('transform-origin', '0px 0px', 'important'); // 念のため基点も指定
    // Config.tjsで 450x800 にしているので、CSSでのwidth/height強制は不要かもしれません。
    // もしTyranoScriptの自動調整でうまくいかない場合は、ここで固定サイズを設定することも検討。
    // tyrano_base_element.style.setProperty('width', '450px', 'important');
    // tyrano_base_element.style.setProperty('height', '800px', 'important');
    console.log("#tyrano_base の transform を script で scale(1) に設定試行");
} else {
    console.error("#tyrano_base が見つかりません");
}
[endscript]

[title name="演算世界とチヨコレイト"]
[bg storage="calc_space.jpg" time="1000"]


[position layer="message0" left="25" top="600" width="400" height="180" page=fore visible=true]

[position layer="message0" page=fore margint="25" marginl="25" marginr="25" marginb="25"]


[ptext name="chara_name_area" layer="message0" color="white" size="20" bold="true" x="40" y="300"] 


[chara_new name="roger" storage="roger_normal.png" jname="ロジャー"]

君は、見たこともない空間にいる。[r]幻想的な一面の花畑、[r]とても現実とは思えない。[p]

[chara_show name="roger" x="200" y="150"]

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
はい！10連ガチャガチャっとね！[l]

; ロジャー退場
[chara_hide name="roger" time="500" wait="true"]

; ガチャ演出 (今は省略、SEや簡単なアニメーションを入れることも可能)

1人の仲間が目の前に現れる。[l]



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
  ; ナルメアが仲間になる処理
  [chara_hide name="silhouette" time="100" wait="true"]
  [chara_new name="narumia" storage="narumia_normal.png" jname="ナルメア"] ; data/fgimage/narumia_normal.png
  [chara_show name="narumia" time="500" wait="true"]
  #ナルメア
  よろしくね、団長ちゃん！
  [jump storage="narumia_scenario.ks" target="*cafe_scene"] // ナルメア編のシナリオファイルへジャンプ (例)

*siete_route_start
  ; シエテが仲間になる処理
  ; ... (同様に)
  [jump storage="siete_scenario.ks" target="*deck_scene"]

*hard_mode_start
  ; 誰も仲間にしない処理
  ; ...
  [jump storage="hard_scenario.ks" target="*auguste_scene"]


; ----- 説明表示用ラベル (任意) -----
*show_narumia_desc
  [mtext text="【ナルメア】\nイージーモード。３つのエンディングが存在します。\nまずはここから始めることをお勧めします" size="20" x="300" y="200" time="500"]
  [wait time=3000] // 3秒待つ
  [mtext_hide time="500"]
  [jump target="*start"] // 選択肢に戻る (または元の場所を記憶して戻る)


; このファイルはここで終わり (各ルートは別ファイルにジャンプする想定)
; もし同じファイルに続けるなら @endjump は不要