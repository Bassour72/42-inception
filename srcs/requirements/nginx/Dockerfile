FROM alpine:3.22.3

# Install nginx and openssl
RUN apk add --no-cache nginx openssl

# Create directories
RUN mkdir -p /run/nginx /etc/nginx/ssl /var/www/html

# Generate self-signed certificate for localhost
RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=Inception/CN=localhost"

# Copy NGINX config and HTML
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/html/index.html /var/www/html/index.html

# Expose HTTPS port
EXPOSE 443

# Start NGINX in foreground
CMD ["nginx", "-g", "daemon off;"]
