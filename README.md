# Partytion

[![License: MIT](https://img.shields.io/badge/License-MIT-teal.svg)](https://opensource.org/licenses/MIT)
[![Lang: Swift 5.0](https://img.shields.io/badge/Lang-Swift%205.0-orange.svg)](https://developer.apple.com/jp/swift/)

- [概要](#概要)
- [デモ](#デモ)
- [開発者向け](#開発者向け)
    - [環境導入](#環境導入)
        - [開発環境](#開発環境)
        - [セットアップ方法](#セットアップ方法)
    - [ディレクトリ構成](#ディレクトリ構成)
- [Contributors](#contributors)
- [ライセンス](#ライセンス)

## 概要
飲み会でのミニゲームとして使えるiPhoneアプリです。  
回答の割合がn対mになるような質問を考えて、みんなで回答しましょう！

## デモ
<img src="https://github.com/naruhiyo/partytion/blob/master/Documentations/demo.gif" width="30%">

## 開発者向け
### 環境導入
#### 開発環境
- macOS Catalina 10.15
- XCode 11.1
- swift 5.x

#### セットアップ方法
下記コマンドを実行し、セットアップしてください。

```sh
# if you don't install `Carthage`, you have to install it.
# $ brew install carthage
# if you don't install `Cocoapods`, you have to install it.
# $ sudo gem install cocoapods

# build
$ cd partytion-app
$ carthage bootstrap --platform iOS # Platform include Mac, iOS, watchOS, tvOS.
$ pod install

# package update.
$ carthage update
$ pod update
```

セットアップ完了後、PartytionApp.xcworkspaceをxcodeから開いてください。

### ディレクトリ構成
```
|- Documentations/  # 設計資料
|- partytion-app/
    |- PartytionApp/
        |- assets/  # CocoaPodsやCarthageで管理していない外部アセットや設定データを格納
        |- Presentation/
            |- Components/
            |- Presenter/   # ビジネスロジック
            |- View/        # UIのレイアウト
    |- PartytionApp.xcworkspace/
    |- Podfile
    |- Cartfile
    |- ...
...
```

## Contributors
- [narugit](https://github.com/narugit)
- [hiyoko3](https://github.com/hiyoko3)

## ライセンス
[MIT](https://github.com/naruhiyo/partytion/blob/master/LICENSE)
