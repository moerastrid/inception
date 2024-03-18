# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/03/18 16:47:05 by ageels        #+#    #+#                  #
#    Updated: 2024/03/18 16:47:16 by ageels        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM debian:11

LABEL maintainer="ageels <ageels@student.codam.nl>"

RUN apt-get update && apt-get upgrade

COPY ./nginx.conf /etx/nginx/nginx.conf

RUN apt-get install nginx -y
RUN apt-get install openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -subj /C=NL/CN=ageels.42.fr/OU=codam -newkey rsa:2048 -keyout /etc/nginx/ssl/inception.key

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]