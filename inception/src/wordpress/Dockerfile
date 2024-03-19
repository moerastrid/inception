# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/03/14 16:24:55 by ageels        #+#    #+#                  #
#    Updated: 2024/03/19 15:57:29 by astrid        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	debian:11

LABEL	maintainer="ageels <ageels@student.codam.nl>"

RUN		apt-get update && apt-get upgrade
RUN		apt-get install wget -y
RUN		apt-get install sudo -y
RUN		apt-get install php7.4-fpm -y
RUN		apt-get install php-mysql -y

COPY	./setup.sh /tmp/wordpress_setup.sh
COPY	./www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp

WORKDIR	/var/www/wordpress
RUN		mkdir -p /run/php

EXPOSE	9000

ENTRYPOINT ["sh", "/tmp/wordpress_setup.sh"]