/* global monogatari */

// Persistent Storage Variable
monogatari.storage ({
	player: {
		name: ''
	}
});

// js/storage.js

// 画像アセット全般の置き場 (キャラクター立ち絵なども将来的にここに追加)
monogatari.assets ('images', {
    // 例: 'icon_item': 'item_icon.png', // img/images/item_icon.png を参照
});

// BGM用
monogatari.assets ('music', {
    // 例: 'theme_song': 'main_theme.ogg', // audio/music/main_theme.ogg を参照
});

// ボイス用
monogatari.assets ('voices', {
    // 例: 'narumia_hello': 'narumia/hello.mp3', // audio/voices/narumia/hello.mp3 を参照
});

// 効果音用
monogatari.assets ('sounds', {
    // 例: 'click_sound': 'click.wav', // audio/sounds/click.wav を参照
});

// 背景画像 (シーン) の定義
// monogatari.assets('scenes', ...) で定義したものは、
// デフォルトで img/scenes/ を基準に見に行きます。
// img/backgrounds/ に置いた場合は、パスを相対的に指定する必要があります。
monogatari.assets('scenes', {
    'title_screen_bg': 'dummy_background.jpg',      // タイトル画面用
    'calc_space_bg': 'dummy_background.jpg',     // プロローグの演算空間用
    'cafe_interior_bg': 'dummy_background.jpg',    // カフェ用
    // もし他のシーン用の背景も用意していたら、同様に追加
    // 'deck_bg': '../backgrounds/deck_bg.jpg',
    // 'auguste_town_bg': '../backgrounds/auguste_town_bg.jpg',
});

// キャラクターの定義 (これは後で本格的に設定します)
monogatari.characters({
    'player': { // 主人公 (名前表示なし、地の文扱いの場合など)
        name: '' // 表示名なし
    },
    'roger': {
        name: 'ロジャー',
        // color: '#ff0000' // 名前の色など (任意)
    },
    'unknown_oracle': {
        name: '？？？' // オロロジャイアちゃん
    },
    'silhouette_companion': {
        name: '？？？' // ナルメア/シエテのシルエット
    },
    'narumia': {
        name: 'ナルメア'
    },
    'sandalphon': {
        name: 'サンダルフォン'
    }
    // 他のキャラクターも順次追加
});