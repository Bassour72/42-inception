# 1. WAIT FOR MARIADB
# This keeps trying to connect to the 'mariadb' host on port 3306
# until it succeeds, then it moves to the next line.
while ! mariadb-admin ping -h"mariadb" --silent; do
    echo "Waiting for MariaDB to be ready..."
    sleep 2
done

echo "MariaDB is up! Starting WordPress installation..."