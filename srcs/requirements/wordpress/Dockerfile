FROM alpine:3.21

# Install PHP-FPM and all required extensions
RUN apk add --no-cache \
    php83-tokenizer \
    php83-pecl-redis \
    php83 \
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
    ca-certificates \
    mariadb-client \
    redis php83-pecl-redis

# Create the user and group if they don't exist
# RUN addgroup -S www-data && adduser -S www-data -G www-data


# DO NOT SHORTEN THIS URL. IT MUST END WITH .phar
# Download the actual program file from the full path
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp


# Copy PHP-FPM config
COPY conf/www.conf /etc/php83/php-fpm.d/www.conf


WORKDIR /var/www/wordpress

# Copy init script
COPY tools/init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 9000

CMD ["/init.sh"]
