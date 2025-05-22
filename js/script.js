monogatari.script({
    // --------------------------------------------------
    // タイトル画面 (仮)
    // --------------------------------------------------
    'Title_Screen': [
        'show background bg_title_placeholder with fadeIn', // タイトル用の背景画像を仮置き
        // 'show image title_logo at center with fadeIn', // タイトルロゴ画像など
        {
            'Choice': {
                'Text': '【演算世界とチヨコレイト】',
                'Class': 'title-main', // CSSで見た目を調整するためのクラス (任意)
                'Start': {
                    'Text': 'ここをタップしてスタート！',
                    'Do': 'jump Prologue_Start',
                    'Class': 'title-start-button' // CSSでボタン風にするためのクラス (任意)
                }
            }
        }
        // TODO: 免責事項は options.js や別の方法で表示する方が良いかもしれない
        // (monogatari.preference('disclaimer_shown', false) などで初回のみ表示するなど)
    ],

    // --------------------------------------------------
    // プロローグ
    // --------------------------------------------------
    'Prologue_Start': [
        'show background bg_calc_space with fadeIn', // プロローグの背景: 演算空間
        'centered 君は、見たこともない空間にいる。ノイズのような歪みが空間に走り、とても現実とは思えない。', // 地の文 (中央揃えの例)
        'unknown_oracle おはよう！お呼びとあらば即参上できない！今日も今日とて限界勤務上等のオロロジャイアちゃんでっす！',
        'roger ｵﾎﾝｴﾍﾝ...!ここは演算世界。僕の力で作り出された世界。あらゆる可能性を探るための場所さ。',
        'roger これから君には僕と一緒に旅をしてもらいたいんだ。',
        'roger そう！君がチョコをもらえる世界を探り出す為に！',
        'roger そんな訳で早速行ってみよう〜！と言っても...僕は一緒に行ける訳ではないんだけどね！社畜の悲しみ！',
        'roger 代わりにガチャ回させてあげるから許して！',
        'roger はい！10連ガチャガチャっとね！',
        // TODO: ガチャ演出を入れるならここに (例: 画面効果、SEなど)
        'centered 1人の仲間が目の前に現れる。',
        'unknown_companion_intro それじゃあ、団長ちゃん、一緒に行こっか♪',
        'centered 仲間になったのは...',
        {
            'Choice': {
                'Dialog': 'どの仲間と行く？', // 選択肢の前のテキスト (任意)
                'Narumia_Choice': {
                    'Text': 'ナルメア',
                    'Do': 'jump Narumia_Route_Start',
                    'Condition': function(){ // イージーモード説明 (ツールチップ等で表示する方が良いかも)
                        // monogatari.component('tooltip').show('イージーモード。３つのエンディングが存在します。まずはここから始めることをお勧めします');
                        return true;
                    }
                },
                'Siete_Choice': {
                    'Text': 'シエテ',
                    'Do': 'jump Siete_Route_Start', // Siete_Route_Start は未作成
                    'Condition': function(){
                        // monogatari.component('tooltip').show('ノーマルモード。6つのエンディングが存在します。標準的な難易度です');
                        return true;
                    }
                },
                'NoCompanion_Choice': {
                    'Text': '誰も仲間にしない',
                    'Do': 'jump Hard_Mode_Start', // Hard_Mode_Start は未作成
                    'Condition': function(){
                        // monogatari.component('tooltip').show('ハードモード。エンディングは１つです。選択肢が増加し、BADENDはタイトルからやり直しです');
                        return true;
                    }
                }
            }
        }
    ],

    // --------------------------------------------------
    // ナルメアルート
    // --------------------------------------------------
    'Narumia_Route_Start': [
        // TODO: ナルメアの立ち絵を表示するコマンド
        // 例: 'show character narumia normal at center with fadeIn'
        'show background bg_cafe with fadeIn', // 背景: グランサイファー船内カフェ
        'centered 君はナルメアと共にグランサイファー船内にあるカフェへと辿り着いた。',
        'sandalphon 注文は？',
        'narumia 団長ちゃん！この【熱々！ホットチョコレート】なんていいんじゃないかな？',
        'centered 注文するのは...',
        {
            'Choice': {
                'OriginalBlend_Choice': {
                    'Text': 'オリジナルブレンド',
                    'Do': 'jump Narumia_Route_OriginalBlend'
                },
                'HotChocolate_Choice': {
                    'Text': 'ホットチョコレート',
                    'Do': 'jump Narumia_Route_HotChocolate'
                }
            }
        }
    ],

    'Narumia_Route_HotChocolate': [
        'centered 君はホットチョコレートを注文した。',
        'narumia 熱いからお姉さんがふーふーして冷ましてあげるね、ふー、ふー...はい、あーん',
        'narumia 美味しい？よかった！ふふっ♪すぐに見つかったね、チョコがもらえる世界。',
        'narumia ハッピーバレンタイン♪',
        'centered 君は無事チョコを貰うことができた。団欒していると、いつの間にか君の周りには仲間達が現れ、チョコを渡しに来た。',
        'centered ━皆と大切に絆を紡いでいた君は、態々演算するまでもなく、チョコを貰える世界にいたのだ。',
        'centered 〜ナルメアEND〜',
        // TODO: エンディング用の演出 (BGM変更、専用背景など)
        'jump Title_Screen' // タイトルへ戻る
    ],

    'Narumia_Route_OriginalBlend': [
        'centered 君はオリジナルブレンドを注文した。',
        'sandalphon オリジナルブレンドだ。良ければ感想を聞かせて欲しい。',
        'centered 君はコーヒーを一口飲んだ。芳醇な香りが口の中に広がり、調和の取れた苦味と酸味が踊り出す。',
        'sandalphon どうだ？',
        'centered 君は答えた。',
        {
            'Choice': {
                'Bitter_Choice': {
                    'Text': '...苦い',
                    'Do': 'jump Narumia_Route_OriginalBlend_Bitter'
                },
                'Delicious_Choice': {
                    'Text': '...美味しい！',
                    'Do': 'jump Narumia_Route_OriginalBlend_Delicious'
                }
            }
        }
    ],

    'Narumia_Route_OriginalBlend_Bitter': [
        'centered 君は苦いと答えた',
        'sandalphon そうか...、苦ければラテにする事もできる。砂糖とミルクを置いておく、好きに使うといい。',
        'sandalphon ...もう少し配合を変えてみるか。',
        'centered サンダルフォンは呟きながら、考え込み始めた。',
        'centered 君は...',
        {
            'Choice': {
                'Leave_Choice': {
                    'Text': '席を立つ',
                    'Do': 'jump Narumia_Route_OriginalBlend_Bitter_Leave' // この先は次回
                },
                'Relax_Choice': {
                    'Text': 'ゆっくりする',
                    'Do': 'jump Narumia_Route_OriginalBlend_Bitter_Relax' // この先は次回
                }
            }
        }
    ],

    'Narumia_Route_OriginalBlend_Delicious': [
        'centered 君は美味しいと答えた。',
        'sandalphon 口にあったのならよかった。ペアリングは要るか？...ちょうどバレンタインだしな。こんなものでよければ、食べてくれ。',
        // TODO: サンダルフォンの立ち絵 (チョコを渡すポーズなど)
        'centered サンダルフォンは、その華奢な指で丁寧に、ラッピングが施された包みを差し出した。',
        'sandalphon ハッピーバレンタイン、団長。',
        'centered 〜サンダルフォンEND〜',
        // TODO: エンディング用の演出
        'jump Title_Screen'
    ],

    // 以下、他のルートや続きのシーンを定義していく
    // 'Siete_Route_Start': [ ... ],
    // 'Hard_Mode_Start': [ ... ],
    // 'Narumia_Route_OriginalBlend_Bitter_Leave': [ ... ],
    // 'Narumia_Route_OriginalBlend_Bitter_Relax': [ ... ],

});