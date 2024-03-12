FROM debian:11

LABEL maintainer="ageels <ageels@student.codam.nl>"

RUN apt-get update && apt-get upgrade

COPY ./wp-config.php /data/webfiles/wp-config.php
COPY ./script.sh script.sh

RUN apt-get install wget -y
# RUN apt-get install php7.4 -y
RUN apt-get install php7.4-fpm -y
RUN apt-get install php7.4-mysql -y
RUN apt-get install mariadb-client -y

RUN wget https://wordpress.org/wordpress-6.4.3.tar.gz -P /data/webfiles
RUN cd /data/webfiles && tar -xzf wordpress-6.4.3.tar.gz && rm wordpress-6.4.3.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN php wp-cli.phar --info && sleep 1
RUN mv wp-cli.phar /usr/bin/wp

EXPOSE 9000

ENTRYPOINT ["bash", "./script.sh" ]