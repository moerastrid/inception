FROM alpine:3.19

RUN apk update && apk upgrade
RUN apk add wget php-fpm php-mysql mariadb-client

RUN wget https://wordpress.org/wordpress-6.4.3.tar.gz -P /data/webfiles
RUN cd /data/webfiles && tar -xzf wordpress-6.4.3.tar.gz && rm wordpress-6.4.3.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chown -R root:root /data/webfiles/wordpress

EXPOSE 9000