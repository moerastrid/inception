# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/03/14 16:25:11 by ageels        #+#    #+#                  #
#    Updated: 2024/03/19 21:21:58 by astrid        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	debian:11
LABEL	maintainer="ageels <ageels@student.codam.nl>"

RUN		apt-get update && apt-get upgrade
RUN		apt-get install mariadb-server -y

COPY	./mariadb.conf /etc/mysql/mariadb.cnf
COPY	./setup.sh /tmp/setup.sh
RUN		chmod +x /tmp/setup.sh

EXPOSE 3306

CMD ["bash", "./tmp/setup.sh" ]