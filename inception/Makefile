# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/02/26 16:03:17 by ageels        #+#    #+#                  #
#    Updated: 2024/02/26 17:59:58 by ageels        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

SRC = ./src/docker-compose.yml

include ./src/.env

all : up

up :
	docker-compose -f $(SRC) up

down :
	docker-compose -f $(SRC) down

clean :
	docker-compose -f $(SRC) down --volumes


#EXTRA (to do : remove later)

ps:
	docker ps

imagelist:
	docker image ls

rm :
	docker rmi src-db src-nginx

.PHONY: all up down clean ps imagelist rm


# .PHONY: all up down clean