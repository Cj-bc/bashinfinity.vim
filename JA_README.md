# bashinfinity.vim

**Vim Plugin for bash-oo-framework**

# description

bashフレームワーク 'bash-oo-framework' 用のvimプラグインです

  - [niieani/bash-oo-framework](https://github.com/niieani/bash-oo-framework)

# 機能

  - omni補完
  - 辞書
  - シンタックスハイライト

# omnifunc

*omni補完*は、関数を使った補完をします。
使い方: インサートモードで`<C-x><C-o>`

このプラグインでは、いくつかのomni補完を提供します。

  - [x] 標準ライブラリ補完
  - [x] `import`の後にライブラリ名補完
  - [ ] Blibライブラリ補完
  - [ ] class補完
    - [ ] class名
    - [ ] プロパティ
    - [ ] クラスメゾット
    - [ ] インスタンスメゾット
  - [ ] importされたファイルの補完も行う

# 辞書

*辞書*は、辞書ファイルに定義された単語の補完を行います。
使い方: インサートモードで`<C-x><C-k>`

# シンタックスハイライト

bash-oo-frameworkの文法に基づいた、sh用シンタックスファイルの拡張です
