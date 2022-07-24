# Hellish Quart Japanese Translation Mod

[Hellish Quart](https://store.steampowered.com/app/1000360/Hellish_Quart/) のテキストを日本語化します

NOTE: The introduction is written at the end in English.

# 要件

* 64 bit Windows OS
        * Linux版の場合, protontricks を併用すれば動作します (詳細)[https://melonwiki.xyz/#/README?id=linux-instructions].
* 最新の Steam版 Hellish Quart
        * Steam版のみ動作を確認しています. GOG版は持ってないので動作確認していません. 動作確認報告は歓迎します.

# インストール方法

`HellishQuartJP-installer-{VERSION}.exe` をダウンロードし, 実行してください. インストールフォルダは自動判定されますが, 必要に応じて Hellish Quart のインストールフォルダ (`Hellish Quart.exe` のある場所) に修正してください.

# アンインストール方法

Hellish Quart インストールフォルダの

* `AutoTranslator` フォルダ
* `version.dll`

を削除してください. さらに他に MelonLoader に依存する modを使用していない場合は,

* `MelonLoader` フォルダ
* `UserData` フォルダ
* `Mods` フォルダ
* `NOTICE.txt`

も削除して下さい.

よくわからなかったら全ファイル消して Steam の「整合性の確認」で復元したほうが早いと思います.

# 技術的補足

* 配布プログラムは [MelonLoader](https://github.com/LavaGang/MelonLoader) および MelonLoader 版 [XUnity Auto Translator](https://github.com/bbepis/XUnity.AutoTranslator) (以下, XUAT), そして私が独自に作成した翻訳テキストの生成プログラムを同梱しているだけです
        * 翻訳機能の詳細は元プログラムのリンクを参照してください
        * よって既に MelonLoader や XUAT を使用しているなら, 足りないファイルを上書きするだけでも動作するはずです
        * ただし, MelonLoader はv0.5.4では動作しません. v0.5.3を使用してください
* 翻訳テキストのフォントは "Yu Mincho" (游明朝) を指定してますが, マシンにインストールされているフォントであれば他のものも使用できると思います. `AutoTranslator/Config.ini` の `OverrideFont` の項目を書き換えることで変更できます
* 現状ではフォントの大きさ調整ができないため, 文字が見切れてる箇所がいくらかあります
* 手動でビルドしたい場合, MelonLoader, XUnity をそれぞれ sln ファイルに従ってビルドし, ps1 を実行すれば同じ構成のファイルが生成されるはずです
        * **現時点では翻訳テキストは同梱していません**
        * インストーラは Nullsoft Scriptable Install System を使用して作成しています

# Credits

* This program includes:
        * [Melonloader](https://github.com/LavaGang/MelonLoader) developed by Lava Gang, licensed under the Apache-2.0 license.
        * [Xunity Auto Translator](https://github.com/bbepis/XUnity.AutoTranslator), MIT licensed
* The original text is created by Kubold

# Requirements

* 64 bit Windows OS
        * Linux版の場合, protontricks を併用すれば動作します (詳細)[https://melonwiki.xyz/#/README?id=linux-instructions].
* Latest Hellish Quart from Steam
        * I check only Steam version.

# How to install

Download  `HellishQuartJP-standalone-installer-v{VERSION}.exe` and run.

# How to uninstall

delete the following files/folders in the Hellish Quart game folder:

* `AutoTranslator` folder
* `version.dll`

In addition, if you don't use any other mods which depend on MelonLoader, delte the following folders:

* `MelonLoader`
* `UserData`
* `Mods`
* `NOTICE.txt`

# Technical Notes:
        * This mod is made of [MelonLoader](https://github.com/LavaGang/MelonLoader), [XUnity Auto Translator](https://github.com/bbepis/XUnity.AutoTranslator) and my translation files. The latter is my only attribution.
                * You can install MelonLoader and XUAT manually. If you already installed them, what you need is copy `AutoTranslator` folder into the game folder.
                * **Note**: the latest MelonLoader (v0.5.4) shouldn't work. install v0.5.3 insteadly if you want to install it manually.  
        * Default font for translated text is "Yu Mincho" (游明朝, one of standard Japanese font family for Windows OS). You can change the font at `OverrideFont` field in `AutoTranslator/Config.ini` file.
        * Some text may be trimmed because I can't change the size.
        * **I wish officially support for localization**