FROM debian:11

RUN apt-get update && apt-get upgrade

COPY ./wp-config.php /data/webfiles/wp-config.php

RUN apt-get install wget -y
RUN apt-get install php8.3-fpm -y
RUN apt-get install php8.3-mysql -y
RUN apt-get install mariadb-client -y

RUN wget https://wordpress.org/wordpress-6.4.3.tar.gz -P /data/webfiles
RUN cd /data/webfiles && tar -xzf wordpress-6.4.3.tar.gz && rm wordpress-6.4.3.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN php wp-cli.phar --info && sleep 5

EXPOSE 9000

ENTRYPOINT [ "./script.sh" ]