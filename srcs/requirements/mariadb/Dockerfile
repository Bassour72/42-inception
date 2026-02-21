FROM alpine:3.22.3

# Install MariaDB
RUN apk add --no-cache mariadb mariadb-client

# 🔥 REMOVE skip-networking (THIS IS THE FIX)
RUN sed -i '/skip-networking/d' /etc/my.cnf.d/mariadb-server.cnf

# Create required directories
RUN mkdir -p /run/mysqld /var/lib/mysql \
    && chown -R mysql:mysql /run/mysqld /var/lib/mysql

# Copy init script
COPY tools/init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 3306

CMD ["/init.sh"]

