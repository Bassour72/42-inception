#!/bin/sh

# Ensure Redis binds to all interfaces so WordPress can see it
# and disable protected mode for the internal network
sed -i "s|bind 127.0.0.1|bind 0.0.0.0|g" /etc/redis.conf
sed -i "s|protected-mode yes|protected-mode no|g" /etc/redis.conf

# Set the persistence directory to your volume path
echo "dir /data" >> /etc/redis.conf

echo "Starting Redis..."
# Use exec so Redis becomes PID 1 (important for Docker)
exec /usr/bin/redis-server /etc/redis.conf
