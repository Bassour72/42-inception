FROM alpine:3.21

RUN apk add --no-cache nginx 

# Create directories for SSL and Nginx runtime
RUN mkdir -p  /run/nginx

# Copy the config to the standard Alpine location
COPY conf/nginx.conf /etc/nginx/http.d/default.conf

COPY tools/Static_site /var/www/Static_site
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

# Forward request and error logs to docker log collector
# RUN ln -sf /dev/stdout /var/log/nginx/access.log \
#     && ln -sf /dev/stderr /var/log/nginx/error.log


