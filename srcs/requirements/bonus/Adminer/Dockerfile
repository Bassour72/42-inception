FROM alpine:3.21

# Install PHP 8.3 and required extensions for MariaDB connection
RUN apk update && apk add --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-session \
    php83-curl \
    wget

# Create the directory for Adminer
WORKDIR /var/www/html

# Download the latest Adminer PHP file and rename it to index.php
RUN wget https://www.adminer.org -O index.php

# Create a user to match your UID 1000 for consistency
RUN adduser -D -u 1000 myuser || true

# Copy a standard PHP-FPM configuration (you can reuse the one from WordPress)
COPY conf/www.conf /etc/php83/php-fpm.d/www.conf

# Ensure ownership matches your shared volume user
RUN chown -R 1000:1000 /var/www/html

EXPOSE 9000

CMD ["php-fpm83", "-F"]
