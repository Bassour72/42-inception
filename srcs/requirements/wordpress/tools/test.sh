
docker build -t wordpress-inception .

docker run -d \
  --name wordpress \
  -p 9000:9000 \
  -e MYSQL_DATABASE=wordpress \
  -e MYSQL_USER=wpuser \
  -e MYSQL_PASSWORD=wppass \
  -e MYSQL_HOST=mariadb \
  -v wp_data:/var/www/wordpress \
  wordpress-inception


docker stop wordpress
docker rm wordpress
docker volume rm wp_data
docker build -t wordpress-inception .
