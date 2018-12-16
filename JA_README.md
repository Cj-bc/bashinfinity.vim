english: [README.md](README.md)

---

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
    - [x] class名
    - [ ] プロパティ
    - [x] クラスメゾット
    - [ ] インスタンスメゾット
  - [ ] importされたファイルの補完も行う

# 辞書

*辞書*は、辞書ファイルに定義された単語の補完を行います。
使い方: インサートモードで`<C-x><C-k>`

# シンタックスハイライト

bash-oo-frameworkの文法に基づいた、sh用シンタックスファイルの拡張です

  - Import: `import`
  - Log: `Log`
  - 例外処理系: `try`/`catch`/`throw`
  - 型: `namespace`/`integer`/boolean`/`string`/`array`/`map`
  - variable definitions: `[string]`/`[array]`/`[integer]`/`[map]`/`[boolean]`
  - スコープ: `private`/`public`
  - クラス関連: `class:`/class method/instance method
