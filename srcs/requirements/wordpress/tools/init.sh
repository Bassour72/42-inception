#!/bin/sh
set -e

# Configure wp-config.php if it doesn't exist
if [ ! -f /var/www/wordpress/wp-config.php ]; then
    cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

    sed -i "s/database_name_here/${MYSQL_DATABASE}/" /var/www/wordpress/wp-config.php
    sed -i "s/username_here/${MYSQL_USER}/" /var/www/wordpress/wp-config.php
    sed -i "s/password_here/${MYSQL_PASSWORD}/" /var/www/wordpress/wp-config.php
    sed -i "s/localhost/${MYSQL_HOST}/" /var/www/wordpress/wp-config.php
fi

# Start PHP built-in server on port 8080
exec php -S 0.0.0.0:8080 -t /var/www/wordpress



