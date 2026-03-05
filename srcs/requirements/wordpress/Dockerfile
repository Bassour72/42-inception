FROM alpine:3.21

# Install PHP-FPM and all required extensions
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

# DO NOT SHORTEN THIS URL. IT MUST END WITH .phar
# Download the actual program file from the full path
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# 2. Add this line HERE to modify the file you just copied
RUN sed -i 's/user = .*/user = 1000/g' /etc/php83/php-fpm.d/www.conf && \
    sed -i 's/group = .*/group = 1000/g' /etc/php83/php-fpm.d/www.conf

# 3. Create the user so PHP-FPM doesn't crash when looking for user 1000
RUN adduser -D -u 1000 myuser || true

# Copy PHP-FPM config
COPY conf/www.conf /etc/php83/php-fpm.d/www.conf


WORKDIR /var/www/wordpress

# Copy init script
COPY tools/init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 9000

CMD ["/init.sh"]
