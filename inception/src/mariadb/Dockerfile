# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/03/14 16:25:11 by ageels        #+#    #+#                  #
#    Updated: 2024/03/19 12:29:17 by astrid        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

LABEL	maintainer="ageels <ageels@student.codam.nl>"

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get -y install \
		mariadb-server \
		mariadb-client

COPY	./setup.sh /tmp/mariadb_setup.sh
COPY	./50-server.cnf /etc/mysql/mariadb.conf.d/

ENTRYPOINT ["sh", "/tmp/mariadb_setup.sh"]

EXPOSE 3306