# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/03/14 16:24:55 by ageels        #+#    #+#                  #
#    Updated: 2024/03/19 12:28:31 by astrid        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

LABEL	maintainer="ageels <ageels@student.codam.nl>"

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get -y install \
		mariadb-client \
		wget \
		curl \
		tar \
		php7.3-fpm \
		php-cli \
		php-mysql \
		vim \
		sudo

COPY	./setup.sh /tmp/wordpress_setup.sh
COPY	./www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp

WORKDIR	/var/www/html/wordpress
RUN		mkdir -p /run/php

EXPOSE	9000

ENTRYPOINT ["sh", "/tmp/wordpress_setup.sh"]