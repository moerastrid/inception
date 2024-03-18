# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/03/18 16:11:29 by ageels        #+#    #+#                  #
#    Updated: 2024/03/18 16:54:30 by ageels        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

LABEL	maintainer="ageels <ageels@student.codam.nl>"

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get -y install \
		mariadb-server \
		mariadb-client

COPY	./script.sh /tmp/script.sh
COPY	./50-server.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

ENTRYPOINT ["bash", "/tmp/script.sh"]