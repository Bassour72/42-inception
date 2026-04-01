FROM alpine:3.21

RUN apk add --no-cache nginx 

RUN mkdir -p  /run/nginx


COPY conf/nginx.conf /etc/nginx/http.d/default.conf

COPY tools/Static_site /var/www/Static_site
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

