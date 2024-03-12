FROM	debian:buster

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get -y install \
		mariadb-server \
		mariadb-client

COPY	./script.sh /tmp/mariadb_setup.sh
COPY	./mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["sh", "/tmp/mariadb_setup.sh"]

EXPOSE 3306

# FROM debian:11

# LABEL maintainer="ageels <ageels@student.codam.nl>"

# RUN apt-get update && apt-get upgrade
# RUN apt-get install systemctl -y

# # COPY ./mariadb.conf etc/my.cnf
# COPY ./mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN mkdir /var/run/mysqld
# RUN chmod 777 /var/run/mysqld

# RUN apt-get install mariadb-server -y

# RUN chown -R mysql:mysql /var/run/mysqld

# COPY ./script.sh script.sh

# RUN chmod 777 script.sh

# EXPOSE 3306

# CMD ["./script.sh"]