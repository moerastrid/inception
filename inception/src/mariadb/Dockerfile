FROM alpine:3.19

ENV UMASK=0777 UMASK_DIR=0777

RUN apk update && apk upgrade
RUN apk add mariadb

RUN mkdir -p /run/mysqld
RUN chown -R mysql:root /run/mysqld

RUN mkdir -p /data/database
RUN chown -R mysql:mysql /data/database


# RUN mariadb-install-db --defaults-extra-file=/etc/my.cnf --skip-test-db

# # CMD ["mariadb"]

# RUN mariadb -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
# # RUN mariadb -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# EXPOSE 3306


COPY ./commands.sh /

ENTRYPOINT ["/commands.sh"]