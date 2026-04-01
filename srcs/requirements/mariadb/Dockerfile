FROM alpine:3.21


RUN apk add --no-cache mariadb mariadb-client


RUN sed -i '/skip-networking/d' /etc/my.cnf.d/mariadb-server.cnf

RUN mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql


COPY tools/init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 3306

CMD ["/init.sh"]


