FROM alpine:3.21

# Install MariaDB and client
RUN apk add --no-cache mariadb mariadb-client

# Remove skip-networking to allow TCP connections
RUN sed -i '/skip-networking/d' /etc/my.cnf.d/mariadb-server.cnf

# Create necessary directories and set permissions
RUN mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql

# Copy the init script from the host to the container
COPY tools/init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 3306

# Start using the initialization script
CMD ["/init.sh"]


