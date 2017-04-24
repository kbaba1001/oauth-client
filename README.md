# docker-compose init

docker-compose を用いて `rails new` したい時の最初の構成

## 使い方

```sh
cp path/to/{Dockerfile,Gemfile,docker-compose.yml} .
# `myapp` を置換
docker-compose build
docker-compose run web bundle
docker-compose run web bundle exec rails new . -B --database=postgresql --force
cp path/to/Gemfile.rails_init .
```
