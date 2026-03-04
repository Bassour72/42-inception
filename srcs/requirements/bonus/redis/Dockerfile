FROM alpine:3.21

# Install Redis without local cache to keep image small
RUN apk add --no-cache redis

# Copy the init script
COPY tools/init.sh /init.sh
RUN chmod +x /init.sh

# Redis default port
EXPOSE 6379

# Use your init script to start Redis in the background (if needed) 
# and then keep the container alive with a foreground process.
ENTRYPOINT ["sh", "/init.sh"]


