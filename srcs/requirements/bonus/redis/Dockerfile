FROM alpine:3.21

RUN apk update && apk add --no-cache redis

# Create data directory and set permissions
RUN mkdir -p /data && chown redis:redis /data

# Copy your setup script
COPY ./tools/init.sh /usr/local/bin/redis_setup.sh
RUN chmod +x /usr/local/bin/redis_setup.sh

EXPOSE 6379

# Use the script as the entrypoint
ENTRYPOINT ["/usr/local/bin/redis_setup.sh"]
