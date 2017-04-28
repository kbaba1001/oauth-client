# OAuth Client

## セットアップ

docker-compose.yml 中の `OAUTH_URL`, `OAUTH_ID`, `OAUTH_SECRET` を次のように書き換える。

- `OAUTH_URL` ... OAuth2 でアクセスするサーバーのURL
- `OAUTH_ID` ... 上記のサーバーに登録してある OAuth アプリの ID
- `OAUTH_SECRET` ... 上記のシークレットキー

```
docker-compose build
docker-compose run web bundle
docker-compose run web bundle exec rails db:setup
docker-compose up # 4000ポートでrails serverが起動
```
