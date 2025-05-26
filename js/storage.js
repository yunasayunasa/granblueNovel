/* global monogatari */

// Persistent Storage Variable
monogatari.storage ({
	player: {
		name: ''
	}
});

// 背景画像の定義 (例)
monogatari.assets('scenes', {
    'bg_calc_space': 'dummy_background.jpg', // プロローグの演算空間用 (仮)
    'bg_cafe': 'dummy_background.jpg',           // カフェ用 (仮)
    'bg_deck': 'dummy_background.jpg',           // 甲板用 (仮)
    // 他のシーン用の背景もここに追加していく
    'title_background': 'dummy_background.jpg' // タイトル画面用 (仮)
});