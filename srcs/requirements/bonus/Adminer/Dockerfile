FROM alpine:3.21

# Install PHP 8.3 and essential extensions
RUN apk add --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-pgsql \
    php83-sqlite3 \
    php83-session \
    php83-json \
    wget

# Use a standard path for PHP-FPM
WORKDIR /var/www/adminer

# Download the single-file Adminer script
RUN wget -O index.php https://www.adminer.org/latest.php

# Copy your custom FPM config
COPY conf/www.conf /etc/php83/php-fpm.d/www.conf

# Set permissions for the 'nobody' user (standard for Alpine PHP)
RUN chown -R nobody:nobody /var/www/adminer && \
    chmod -R 755 /var/www/adminer

EXPOSE 9000

CMD ["/usr/sbin/php-fpm83", "-F"]

