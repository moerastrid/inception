FROM alpine:3.19

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client

# global config file
# COPY ./mariadb.conf /etc/my.cnf.d/mariadb-server.cnf

# RUN mariadb


# RUN mariadb -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
# RUN mysql -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"


EXPOSE 3306