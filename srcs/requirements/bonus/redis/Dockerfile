FROM alpine:3.21

RUN apk update && apk add --no-cache redis

RUN mkdir -p /data && chown redis:redis /data

COPY ./tools/init.sh /usr/local/bin/redis_setup.sh
RUN chmod +x /usr/local/bin/redis_setup.sh

EXPOSE 6379

ENTRYPOINT ["/usr/local/bin/redis_setup.sh"]
