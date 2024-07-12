〇初回起動
------------------------------------------------------------------
#docker-composeがあるディレクトリに移動

#イメージを作成
docker-compose build

#イメージを確認
docker images

#dockerを起動
docker-compose up -d

#起動確認
docker ps
------------------------------------------------------------------

〇必要に応じて
------------------------------------------------------------------
#コンテナにログイン
php => docker exec -it php bash
DB => docker exec -it db bash
phomyadmin => docker exec -it phpmyadmin bash

#コンテナ停止
docker-compose stop
------------------------------------------------------------------

TEST1