FROM alpine:3.21

RUN apk add --no-cache nginx openssl apache2-utils

RUN mkdir -p /etc/nginx/ssl /run/nginx


RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/inception.key \
    -out /etc/nginx/ssl/inception.crt \
    -subj "/C=MA/ST=KH/L=Khouribga/O=42/OU=42/CN=ybassour.42.fr/UID=ybassour"


COPY conf/nginx.conf /etc/nginx/http.d/default.conf

EXPOSE 443
COPY tools/init.sh /init.sh
RUN chmod +x /init.sh

CMD [ "/init.sh" ]
