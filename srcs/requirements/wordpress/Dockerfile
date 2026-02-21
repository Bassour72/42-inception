# Use Alpine base image
FROM alpine:3.22.3

# Install PHP 8.3 + required extensions and wget
RUN apk add --no-cache \
    php83 \
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
    wget \
    bash

# Create WordPress directory
RUN mkdir -p /var/www/wordpress

# Download latest WordPress
RUN wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz \
    && tar -xzf /tmp/wordpress.tar.gz -C /var/www \
    && rm /tmp/wordpress.tar.gz

# Copy init script
COPY /tools/init.sh /init.sh
RUN chmod +x /init.sh

# Expose port for PHP built-in server
EXPOSE 8080

# Start container
CMD ["/init.sh"]


