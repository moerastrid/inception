# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/03/14 16:54:50 by ageels        #+#    #+#                  #
#    Updated: 2024/03/19 15:43:27 by astrid        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	debian:11

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
		-out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key

COPY	./nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE	443

ENTRYPOINT ["nginx", "-g", "daemon off;"]