# 開発のすゝめ

## branch命名規則
『Issue番号-prefix-やる事 (単語は ”_” 区切り)』
例：Issue「#1 Rubocopを入れる」なら「1-add-rubocop_install」
### prefixの定義
- `add`: 新規追加
- `fix`: 修正（バグ含む）
- `refactor`: 挙動の変更がない修正
- `remove`: 単に消すだけ
- `test`: テスト

参考記事
- [qiita記事](https://qiita.com/konatsu_p/items/dfe199ebe3a7d2010b3e)

## commit message
可読性を上げるため日本語を用いる
### prefixの定義
branch命名規則と同じ

例：
```
add: ユーザモデルを追加
(空行)
ユーザモデルの属性は◯◯、▲▲
```
参考記事
- [git commitメッセージ](https://qiita.com/itosho/items/9565c6ad2ffc24c09364)

- [CUIで複数行書く方法](https://qiita.com/mimickn/items/586eb64e9da5b5c63e4f)


## test
- 標準のministestを使う
- 可読性を上げるため日本語を用いる

# Sample App

メインの Rails アプリケーション

## 環境構築

``` bash
docker-compose build
docker-compose run --rm app bin/setup
```

## サーバー起動

``` bash
docker-compose up
open http://localhost:3000
```

## テストの実行

``` bash
docker-compose run --rm app bin/rails test
```

## Rubocop の実行

``` bash
# 普通に実行
docker-compose run --rm app bundle exec rubocop

# 修正も適用
docker-compose run --rm app bundle exec rubocop -a

# 破壊的な変更も適用（非推奨）
docker-compose run --rm app bundle exec rubocop -A
```

## サーバへのデプロイ

0. (初回のみ) `aws ecs run-task --cluster internship-aug2022-1 --task-definition internship-aug2022-1-db-create --launch-type FARGATE --network-configuration '{"awsvpcConfiguration":{"subnets":["subnet-0334f01a7f2e84910","subnet-06e60f8f517606654","subnet-0df45f1bdece2446d"],"securityGroups": ["sg-04d49093688ad6e41"],"assignPublicIp":"ENABLED"}}' --count 1` で `rails db:create` を本番環境のDBに適用し、この Rails アプリが使用する MySQL のデータベースを作成する。
1. [GitHub Actions タブの deploy ワークフロー](https://github.com/speee/hr-eng-internship-2022-1st-team-1/actions) に移動
2. `This workflow has a workflow_dispatch event trigger.` の右側にある `Run Workflow` ボタンをクリック
3. `Use workflow from` のセレクトボックスからデプロイ対象のブランチを選択
4. `Run Workflow` ボタンをクリック

## ステージング
https://aug2022-1.intern.speee.in
