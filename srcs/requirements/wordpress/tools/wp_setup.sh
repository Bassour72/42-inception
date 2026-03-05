# 1. WAIT FOR MARIADB
# This keeps trying to connect to the 'mariadb' host on port 3306
# until it succeeds, then it moves to the next line.
while ! mariadb-admin ping -h"mariadb" --silent; do
    echo "Waiting for MariaDB to be ready..."
    sleep 2
done

echo "MariaDB is up! Starting WordPress installation..."

2. Force Debug Mode (To see the REAL error)

 docker exec -it wordpress php83 /usr/local/bin/wp config set WP_DEBUG true --raw --allow-root
Success: Updated the constant 'WP_DEBUG' in the 'wp-config.php' file with the raw value 'true'.
┏[ 03/05/2026 @ 2:00:10 AM +00][ ybassour ::  ybassour21][ RAM: 5/11GB][ 100][ 0.394s]
