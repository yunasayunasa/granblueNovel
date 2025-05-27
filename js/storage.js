/* global monogatari */

// Persistent Storage Variable
monogatari.storage ({
	player: {
		name: ''
	}
});
// js/storage.js

// 画像アセット全般 (キャラクター立ち絵ファイルへのパスは monogatari.characters で指定)
monogatari.assets('images', {
    // ここは現時点では空でOK (汎用画像などがあれば追加)
});

// BGM用 (ナルメアルートで使うBGMがあればここに追加)
monogatari.assets('music', {
    // 例: 'prologue_theme': 'prologue.ogg',
    // 例: 'cafe_ambience': 'cafe.mp3',
});

// ボイス用 (今回は省略)
monogatari.assets('voices', {});

// 効果音用 (選択肢決定音などあれば追加)
monogatari.assets('sounds', {
    // 例: 'select_sound': 'select.wav',
});

// 背景画像 (シーン) の定義
monogatari.assets('scenes', {
    'title_background': 'title_bg.jpg',      // assets/scenes/title_bg.jpg
    'calc_space': 'calc_space_bg.jpg',         // assets/scenes/calc_space_bg.jpg
    'cafe': 'cafe_bg.jpg',                 // assets/scenes/cafe_bg.jpg
    // 必要に応じて他のシーン用の背景も追加
});

// キャラクターの定義
monogatari.characters({
    'player': { // 主人公 (地の文などで使う場合、名前表示なし)
        name: ''
    },
    'roger': {
        name: 'ロジャー',
        // color: '#FF7F50', // 名前の色 (任意)
        sprites: { // 表情差分
            normal: 'roger_normal.png' // assets/characters/roger_normal.png
        }
    },
    'unknown_oracle': { // プロローグのオロロジャイアちゃん
        name: '？？？',
        // sprites: { normal: 'ororojahia_normal.png' } // もし立ち絵を用意するなら
    },
    'silhouette_companion': { // 仲間選択時のシルエット
        name: '？？？',
        sprites: {
            default: 'companion_silhouette.png' // assets/characters/companion_silhouette.png
        }
    },
    'narumia': {
        name: 'ナルメア',
        // color: '#FF69B4',
        sprites: {
            normal: 'narumia_normal.png', // assets/characters/narumia_normal.png
            smile: 'narumia_smile.png'    // assets/characters/narumia_smile.png (もしあれば)
            // 他の表情もあれば追加 (例: angry: 'narumia_angry.png')
        }
    },
    'sandalphon': {
        name: 'サンダルフォン',
        // color: '#87CEEB',
        sprites: {
            normal: 'sandalphon_normal.png' // assets/characters/sandalphon_normal.png
            // 他の表情もあれば追加
        }
    }
    // 他の登場キャラクター (ディアンサ、アンスリア、ニーアなど) も順次追加
});
