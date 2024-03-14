# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/03/14 16:54:50 by ageels        #+#    #+#                  #
#    Updated: 2024/03/14 17:03:19 by ageels        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

LABEL	maintainer="ageels <ageels@student.codam.nl>"

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get -y install \
		nginx \
		openssl \
		vim

RUN		mkdir /etc/nginx/ssl

RUN		openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
		-subj "/C=NL/ST=Amsterdam/L=NL/O=CODAM/OU=Cetus/CN=localhost" \
		-out /etc/nginx/ssl/ageels.42.fr.crt \
		-keyout /etc/nginx/ssl/ageels.42.fr.key

COPY	./nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE	443

ENTRYPOINT ["nginx", "-g", "daemon off;"]