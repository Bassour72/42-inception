#!/bin/sh

sed -i "s|bind 127.0.0.1|bind 0.0.0.0|g" /etc/redis.conf
sed -i "s|protected-mode yes|protected-mode no|g" /etc/redis.conf

echo "dir /data" >> /etc/redis.conf

echo "Starting Redis..."
exec /usr/bin/redis-server /etc/redis.conf
