docker network create inception
docker network connect inception mariadb
docker network connect inception wordpress
netstat -nlpt

docker build -t  my-mariadb-image ./srcs/requirements/mariadb
docker build -t wordpress-inception ./srcs/requirements/wordpress

docker run -d \
    --name mariadb \
    --network inception \
  -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD=rootpass \
  -e MYSQL_DATABASE=wordpress \
  -e MYSQL_USER=wpuser \
  -e MYSQL_PASSWORD=wppass \
  my-mariadb-image


# 
CREATE USER 'wpuser'@'%' IDENTIFIED BY 'wppass';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'%';
FLUSH PRIVILEGES;
