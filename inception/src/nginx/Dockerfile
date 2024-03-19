# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/03/14 16:54:50 by ageels        #+#    #+#                  #
#    Updated: 2024/03/19 17:42:11 by astrid        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	debian:11

LABEL	maintainer="ageels <ageels@student.codam.nl>"

RUN		apt-get update && apt-get upgrade
RUN		apt-get install nginx -y
RUN		apt-get install openssl -y

RUN		mkdir /etc/nginx/ssl

RUN		openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
		-subj "/DN=./" \
		-out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key

COPY	./nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE	443

ENTRYPOINT ["nginx", "-g", "daemon off;"]