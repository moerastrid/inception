# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/02/28 11:58:00 by ageels        #+#    #+#                  #
#    Updated: 2024/02/28 17:24:07 by astrid        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = inception
SRC = ./src/Docker-compose.yml
DATA_DIR = $(HOME)/data

include ./src/.env

all : obj_folder up

obj_folder:
	mkdir -pv $(DATA_DIR)
	mkdir -pv $(DATA_DIR)/database
	mkdir -pv $(DATA_DIR)/webfiles

up :
	docker-compose -f $(SRC) -p $(NAME) up --build

down :
	docker-compose -f $(SRC) -p $(NAME) down

clean :
	docker-compose -f $(SRC) -p $(NAME) down --remove-orphans --volumes --rmi all
# rmdir -pv $(DATA_DIR)/database
# rmdir -pv $(DATA_DIR)/webfiles
# rmdir -pv $(DATA_DIR)
	rm -fr $(DATA_DIR)

re : down all

.PHONY : all up down clean