docker build -t my-mariadb .


docker run -d \
  --name mariadb \
  -p 3306:3306 \
  -e MYSQL_DATABASE=wordpress \
  -e MYSQL_USER=wpuser \
  -e MYSQL_PASSWORD=wppass \
  -e MYSQL_ROOT_PASSWORD=rootpass \
  -v mariadb_data:/var/lib/mysql \
  mariadb-inception

docker logs mariadb
docker exec -it mariadb sh

mariadb -u wpuser -p
