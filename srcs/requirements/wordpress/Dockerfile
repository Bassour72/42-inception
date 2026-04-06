FROM alpine:3.21
# TODO: remove  php83-json \  php83-ftp \ ca-certificates \ php83-xml \ php83-xmlreader
RUN apk add --no-cache \
    php83 \
    php83-tokenizer \
    php83-pecl-redis \
    php83-fpm \
    php83-mysqli \
    php83-json \ 
    php83-curl \
    php83-dom \
    php83-exif \
    php83-fileinfo \
    php83-mbstring \
    php83-openssl \
    php83-xml \
    php83-zip \
    php83-phar \
    wget \
    php83-ctype \
    ca-certificates \
    mariadb-client \
    php83-ftp \
    php83-intl \
    php83-session \
    php83-xmlreader \
    php83-zlib

RUN ln -sf /usr/bin/php83 /usr/bin/php


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN sed -i 's/user = .*/user = 1000/g' /etc/php83/php-fpm.d/www.conf && \
    sed -i 's/group = .*/group = 1000/g' /etc/php83/php-fpm.d/www.conf

RUN adduser -D -u 1000 myuser || true


COPY conf/www.conf /etc/php83/php-fpm.d/www.conf


WORKDIR /var/www/wordpress

COPY tools/init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 9000

CMD ["/init.sh"]
