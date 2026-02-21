docker stop mariadb
docker rm mariadb
docker volume rm mariadb_data

docker build --no-cache -t mariadb-inception .

docker run -d \
  --name mariadb \
  --network inception \
  --env-file ~/env/42-inception/srcs/.env \
  -v mariadb_data:/var/lib/mysql \
  mariadb-inception

