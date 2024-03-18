# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/02/28 11:58:00 by ageels        #+#    #+#                  #
#    Updated: 2024/03/18 17:06:58 by ageels        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME		= inception
SRC			= ./src/docker-compose.yml
DATA_DIR	= $(HOME)/data
HOST_LINK	= "127.0.0.1	ageels.42.fr" > /etc/hosts

all : $(NAME)

$(NAME) : obj_folder up

obj_folder:
	mkdir -pv $(DATA_DIR)
	mkdir -pv $(DATA_DIR)/mariadb
	mkdir -pv $(DATA_DIR)/wordpress

up : obj_folder
	docker-compose -f $(SRC) -p $(NAME) up --build

down :
	docker-compose -f $(SRC) -p $(NAME) down

clean :
	docker-compose -f $(SRC) -p $(NAME) down --remove-orphans --volumes --rmi all
	
fclean: clean
	docker volume prune -f
	docker container prune -f
	docker image prune -f
	rm -fr $(DATA_DIR)

re : fclean all

.PHONY : all up down clean