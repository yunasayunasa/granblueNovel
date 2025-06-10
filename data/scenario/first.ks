; first.ks (新しいタイトル画面)

*start ; ゲーム起動時に最初に実行されるラベル

[cm]
[clearfix]
[stopbgm]

; タイトル用の背景画像 (data/bgimage/title_page_bg.jpg を用意)
[bg storage="title_page_bg.jpg" time="500"]

; ゲームタイトル表示 (例)
[mtext text="演算世界とチヨコレイト" x="75" y="150" size="40" color="white" time="500"] ; 位置やサイズは調整

; スタートボタン (opening.ks の *prologue_start へジャンプ)
[glink text="ゲームスタート" x="125" y="500" width="200" size="28" color="blue" target="*jump_to_opening"]
[s]

*jump_to_opening
[cm]
[clearfix]
[jump storage="opening.ks" target="*prologue_start"] ; opening.ks へジャンプ