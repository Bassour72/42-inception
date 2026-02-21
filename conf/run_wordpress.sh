docker stop wordpress
docker rm wordpress

docker build -t wordpress-inception .


docker run -d \
  --name wordpress \
  --network inception \
  -p 9000:9000 \
  --env-file ~/env/42-inception/srcs/.env \
  -v wp_data:/var/www/wordpress \
  wordpress-inception




# docker exec -it wordpress sh
# php -r 'new mysqli(getenv("MYSQL_HOST"), getenv("MYSQL_USER"), getenv("MYSQL_PASSWORD"), getenv("MYSQL_DATABASE")) or die("Cannot connect"); echo "Connected\n";'


docker build -t wordpress-inception:latest ./wordpress

docker run -d \
  --name wordpress \
  --network inception \
  -e MYSQL_DATABASE=wordpress \
  -e MYSQL_USER=wpuser \
  -e MYSQL_PASSWORD=wppass \
  -e MYSQL_HOST=mariadb \
  -p 8080:8080 \
  wordpress-inception:latest
