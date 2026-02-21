#!/bin/sh
set -e

# Ensure directories exist
mkdir -p /var/lib/mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql /run/mysqld

# Initialize DB if needed
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing database..."
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

# Start MariaDB in foreground with TCP
exec mysqld \
  --user=mysql \
  --datadir=/var/lib/mysql \
  --bind-address=0.0.0.0 \
  --port=3306
