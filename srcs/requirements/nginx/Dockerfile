FROM alpine:3.21

RUN apk add --no-cache nginx openssl

# Create directories for SSL and Nginx runtime
RUN mkdir -p /etc/nginx/ssl /run/nginx

# Generate SSL certificate using your 42 login
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/inception.key \
    -out /etc/nginx/ssl/inception.crt \
    -subj "/C=MA/ST=KH/L=Khouribga/O=42/OU=42/CN=ybassour.42.fr/UID=ybassour"

# Copy the config to the standard Alpine location
COPY conf/nginx.conf /etc/nginx/http.d/default.conf

COPY conf/html /var/www/html
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

# Forward request and error logs to docker log collector
# RUN ln -sf /dev/stdout /var/log/nginx/access.log \
#     && ln -sf /dev/stderr /var/log/nginx/error.log
