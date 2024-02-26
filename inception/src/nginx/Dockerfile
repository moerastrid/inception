# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/02/26 16:03:25 by ageels        #+#    #+#                  #
#    Updated: 2024/02/26 17:23:28 by ageels        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM nginx:alpine

RUN apk update
RUN apk add nginx

COPY ./nginx.conf /etc/nginx/nginx.conf

#define the network port(s) that this container will listen to at runtime
#EXPOSE 433

CMD ["nginx", "-g", "daemon off;"]
