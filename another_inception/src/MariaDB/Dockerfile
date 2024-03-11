FROM debian:11

RUN apt-get update && apt-get upgrade
RUN apt-get install systemctl -y

COPY ./mariadb.conf etc/my.cnf
RUN mkdir /var/run/mysqld
RUN chmod 777 /var/run/mysqld

RUN apt-get install mariadb-server -y

RUN chown -R mysql:mysql /var/run/mysqld

COPY ./script.sh script.sh

RUN chmod 777 script.sh

EXPOSE 3306

CMD ["./script.sh"]