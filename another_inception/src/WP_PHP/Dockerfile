FROM debian:11

RUN apt-get update && apt-get upgrade
RUN apt-get install wget -y
RUN apt-get install php-fpm -y
RUN apt-get install php-mysql -y
RUN apt-get install mariadb-client -y

RUN wget https://wordpress.org/wordpress-6.4.3.tar.gz -P /data/webfiles
RUN cd /data/webfiles && tar -xzf wordpress-6.4.3.tar.gz && rm wordpress-6.4.3.tar.gz

RUN cd ~ && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

EXPOSE 9000

ENTRYPOINT [ "./script.sh" ]