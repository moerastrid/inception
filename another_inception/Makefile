# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/02/28 11:58:00 by ageels        #+#    #+#                  #
#    Updated: 2024/02/28 13:17:23 by astrid        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = inception
SRC = ./src/Docker-compose.yml
DATA_DIR = $(HOME)/data

include ./src/variables.env

all : obj_folder up

obj_folder:
	mkdir -pv $(DATA_DIR)

up :
	docker-compose -f $(SRC) -p $(NAME) up 

down :
	docker-compose -f $(SRC) -p $(NAME) down

clean :
	docker-compose -f $(SRC) -p $(NAME) down --remove-orphans --volumes --rmi all
	rm -dfv $(DATA_DIR)