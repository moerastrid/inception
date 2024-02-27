# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/02/26 16:03:17 by ageels        #+#    #+#                  #
#    Updated: 2024/02/27 14:28:47 by ageels        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

SRC = ./src/docker-compose.yml
DATA_DIR = /home/ageels/data

include ./src/*.env

all : obj_folder up

obj_folder:
	mkdir -pv $(DATA_DIR)

up :
	docker-compose -f $(SRC) up

down :
	docker-compose -f $(SRC) down

clean :
	docker-compose -f $(SRC) down --volumes
	rm -dfv $(DATA_DIR)


#EXTRA (to do : remove later)

ps:
	docker ps

imagelist:
	docker image ls

rm :
	docker rmi src-db src-nginx

.PHONY: all up down clean ps imagelist rm


# .PHONY: all up down clean