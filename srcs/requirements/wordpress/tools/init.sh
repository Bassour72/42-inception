#!/bin/sh
set -e

# Load secrets
SQL_PASSWORD=$(cat /run/secrets/db_password)
WP_ADMIN_PASSWORD=$(cat /run/secrets/wp_admin_password)
WP_USER_PASSWORD=$(cat /run/secrets/wp_user_password)

sleep 10
cd /var/www/wordpress

if [ ! -f "wp-config.php" ]; then
    echo "Downloading WordPress..."
    php83 -d memory_limit=-1 /usr/local/bin/wp core download --allow-root

    echo "Creating wp-config.php..."
    php83 /usr/local/bin/wp config create --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306

    echo "Installing WordPress..."
    php83 /usr/local/bin/wp core install --allow-root \
        --url=$WP_URL \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL \
        --skip-email

    echo "Creating a simple user..."
    php83 /usr/local/bin/wp user create $WP_USER $WP_USER_EMAIL \
        --role=author \
        --user_pass=$WP_USER_PASSWORD \
        --allow-root

    echo "Setting up Redis plugin..."
    php83 /usr/local/bin/wp plugin install redis-cache --activate --allow-root

    # CONFIGURE REDIS (Replaces the broken sed command)
    php83 /usr/local/bin/wp config set WP_REDIS_HOST redis --allow-root
    php83 /usr/local/bin/wp config set WP_REDIS_PORT 6379 --raw --allow-root
    php83 /usr/local/bin/wp config set WP_CACHE true --raw --allow-root

    echo "Enabling Redis object cache..."
    php83 /usr/local/bin/wp redis enable --allow-root
fi

# Fix permissions for the 'nobody' user (default in Alpine)
echo "Correcting permissions..."
chown -R nobody:nobody /var/www/wordpress

echo "Starting PHP-FPM..."
exec php-fpm83 -F
