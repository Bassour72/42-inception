FROM alpine:3.21

RUN apk add --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-pgsql \
    php83-sqlite3 \
    php83-session \
    php83-json \
    wget

WORKDIR /var/www/adminer

RUN wget -O index.php https://www.adminer.org/latest.php

COPY conf/www.conf /etc/php83/php-fpm.d/www.conf

RUN chown -R nobody:nobody /var/www/adminer && \
    chmod -R 755 /var/www/adminer

EXPOSE 9000

CMD ["/usr/sbin/php-fpm83", "-F"]

