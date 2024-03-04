# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/02/28 11:58:00 by ageels        #+#    #+#                  #
#    Updated: 2024/03/04 18:18:30 by ageels        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = inception
SRC = ./src/Docker-compose.yml
DATA_DIR = $(HOME)/data

include ./src/.env

all : up

obj_folder:
	mkdir -pv $(DATA_DIR)
	mkdir -pv $(DATA_DIR)/database
	mkdir -pv $(DATA_DIR)/webfiles

up : obj_folder
	docker-compose -f $(SRC) -p $(NAME) up --build --detach

down :
	docker-compose -f $(SRC) -p $(NAME) down

clean :
	docker-compose -f $(SRC) -p $(NAME) down --remove-orphans --volumes --rmi all
	docker volume prune -fDDOMAIN_NAME
	docker container prune -f
	docker image prune -f
# rmdir -pv $(DATA_DIR)/database
# rmdir -pv $(DATA_DIR)/webfiles
# rmdir -pv $(DATA_DIR)
	rm -fr $(DATA_DIR)

re : down all

.PHONY : all up down clean