# アプリ名：Site Note
URL：https://site-note.herokuapp.com
（ゲストログイン機能を付けております。）

![スクリーンショット 2021-08-22 3 39 40](https://user-images.githubusercontent.com/79825084/130467935-af324d95-cbc1-48bb-bc2d-656725c207fe.png)

## サイト概要
  SITE NOTEは様々なWebサイトを管理するためのツールです。 <br/>お気に入りのサイトや学習で利用したサイトにあなたのメモを添えて管理することができます。
  
## 制作背景
  プログラミングの学習をする際に、様々なWebサイトを通じて情報を収集していますが、参考にしたサイトの管理が煩雑になっておりました。
  Webサイトにメモを添えて管理できるツールがあればと思い制作しました。
  
## 機能・実装一覧
- URLからWebサイトの情報をスクレイピングし、Webサイトの画像、タイトル、説明を取得し保存する機能
- マークダウン記法の導入、及び記述内容のプレビュー機能、コードハイライト機能（Ajax）
- タグ付け機能
- 登録したWebサイトの検索機能（検索条件：タイトル、メモ、タグ、 投稿時間による並び替え)

## 操作デモ動画
画面をクリックするとYoutube上でデモ動画が再生されます。（音声なし）
[![SiteNote](https://img.youtube.com/vi/Zb2XzCsS-EA/0.jpg)](https://www.youtube.com/watch?v=Zb2XzCsS-EA)

## 使用技術

- バックエンド言語：Ruby 3.0.2
- フレームワーク：Ruby on Rails 6.1.4  
- データベース ：PostgreSQL 13.3
- フロントエンド言語：JavaScript
- JSフレームワーク：jQuery
- CSSフレームワーク：bootstrap 5.1.0
- デプロイ：Heroku


