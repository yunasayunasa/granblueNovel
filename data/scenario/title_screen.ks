; title_screen.ks

*show_title // タイトル画面表示用のラベル

[cm] ; 画面クリア
[stopbgm] ; もしBGMが流れていたら停止

; タイトル用の背景画像 (data/bgimage/title_page_bg.jpg を用意する例)
[bg storage="title_page_bg.jpg" time="500"]

; タイトルロゴ画像など (data/fgimage/title_logo.png を用意する例)
; [image storage="title_logo.png" layer="0" x="100" y="100" time="500"] ; 位置やサイズは調整

; ゲームタイトルテキスト (画像を使わない場合)
[mtext text="演算世界とチヨコレイト" x="100" y="200" size="40" color="white" time="500"]

; スタートボタン
[glink text="ゲームスタート" x="150" y="500" width="150" size="28" color="blue" target="*jump_to_prologue"]
[s]

*jump_to_prologue
; プロローグ (first.ks の *start ラベル) へジャンプ
[jump storage="first.ks" target="*start"]