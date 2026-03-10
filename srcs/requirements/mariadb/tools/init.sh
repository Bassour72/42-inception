#!/bin/sh
# Read the secrets
set -e
SQL_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)
SQL_PASSWORD=$(cat /run/secrets/db_password)

# Ensure directories have the correct owner
chown -R mysql:mysql /var/lib/mysql /run/mysqld
#TODO: make the derictory to has to owner
# Initialize database if it's the first time
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql --rpm
    
    # Start temporary server to set up users
    # Replace $SQL_ROOT_PASSWORD, $SQL_DATABASE, etc., with your env variables
    mysqld --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};
CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF
fi

echo "Starting MariaDB server..."
# Using --bind-address=0.0.0.0 allows connections from the WordPress container
exec mysqld \
  --user=mysql \
  --datadir=/var/lib/mysql \
  --bind-address=0.0.0.0 \
  --port=3306 \
  --console
