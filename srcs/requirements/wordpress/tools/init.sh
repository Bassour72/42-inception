#!/bin/sh
set -e

# Load secrets
SQL_PASSWORD=$(cat /run/secrets/db_password)
WP_ADMIN_PASSWORD=$(cat /run/secrets/wp_admin_password)
WP_USER_PASSWORD=$(cat /run/secrets/wp_user_password)

cd /var/www/wordpress

# 1. WAIT for MariaDB
echo "Waiting for MariaDB..."
until mariadb -h mariadb -u "$SQL_USER" -p"$SQL_PASSWORD" -e "SELECT 1;" > /dev/null 2>&1; do
    echo "MariaDB is unavailable - sleeping..."
    sleep 2
done

# 2. Setup WordPress if not configured
if [ ! -f "wp-config.php" ]; then
    echo "WordPress not found. Starting installation..."

    if [ ! -f "wp-settings.php" ]; then
        # ADDED memory limit flag
        php83 -d memory_limit=-1 /usr/local/bin/wp core download --allow-root
    fi

    php83 -d memory_limit=-1 /usr/local/bin/wp config create --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306

    php83 -d memory_limit=-1 /usr/local/bin/wp core install --allow-root \
        --url=$WP_URL \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL \
        --skip-email

    php83 -d memory_limit=-1 /usr/local/bin/wp user create "$WP_USER" "$WP_USER_EMAIL" \
        --role=author \
        --user_pass="$WP_USER_PASSWORD" \
        --allow-root

    # Redis Setup
    php83 -d memory_limit=-1 /usr/local/bin/wp config set WP_REDIS_HOST redis --allow-root
    php83 -d memory_limit=-1 /usr/local/bin/wp config set WP_REDIS_PORT 6379 --raw --allow-root
    php83 -d memory_limit=-1 /usr/local/bin/wp plugin install redis-cache --activate --allow-root
    php83 -d memory_limit=-1 /usr/local/bin/wp redis enable --allow-root
fi

# 3. Inject FTP settings
if ! grep -q "FTP_HOST" wp-config.php; then
    echo "Injecting FTP settings..."
    cat << EOF >> wp-config.php

define('FS_METHOD', 'ftpext');
define('FTP_HOST', 'ftp:21');
define('FTP_USER', '${FTP_USER}');
define('FTP_PASS', '${FTP_PWD}');
define('FTP_SSL', false);
define('FTP_BASE', '/');
define('FTP_CONTENT_DIR', '/wp-content/');
define('FTP_PLUGIN_DIR', '/wp-content/plugins/');
EOF
fi
# 4. Final permissions (Crucial: 775 allows group writing)
find /var/www/wordpress -type d -exec chmod 775 {} +
find /var/www/wordpress -type f -exec chmod 664 {} +

# 4. Final permissions
chown -R 1000:1000 /var/www/wordpress
chmod -R 775 /var/www/wordpress
echo "Starting PHP-FPM..."
exec php-fpm83 -F
