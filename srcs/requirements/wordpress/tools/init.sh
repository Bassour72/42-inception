#!/bin/sh
set -e
SQL_PASSWORD=$(cat /run/secrets/db_password)
WP_ADMIN_PASSWORD=$(cat /run/secrets/wp_admin_password)

# Wait for MariaDB to be fully ready
sleep 10

# Go to the right directory
cd /var/www/wordpress

if [ ! -f "wp-config.php" ]; then
    echo "Downloading WordPress..."
    php83 -d memory_limit=-1 /usr/local/bin/wp core download --allow-root

    echo "Creating wp-config.php..."
    php83 -d memory_limit=-1 /usr/local/bin/wp config create --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306

    echo "Installing WordPress..."
    php83 -d memory_limit=-1 /usr/local/bin/wp core install --allow-root \
        --url=$WP_URL \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL \
        --skip-email
fi

echo "Starting PHP-FPM on port 9000..."
exec php-fpm83 -F





