# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: astrid <astrid@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/03/19 12:05:57 by astrid        #+#    #+#                  #
#    Updated: 2024/03/19 12:30:21 by astrid        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = inception
SRC = ./src/docker-compose.yml
DATA_DIR = $(HOME)/data
CMD = echo "127.0.0.1	ageels.42.fr" > /etc/hosts

all : $(NAME)

up : $(NAME)

obj_folder :
	mkdir -pv $(DATA_DIR)
	mkdir -pv $(DATA_DIR)/mariadb
	mkdir -pv $(DATA_DIR)/wordpress

$(NAME) : obj_folder
#	sudo $(CMD)
	docker-compose -f $(SRC) -p $(NAME) up --build

down :
	docker-compose -f $(SRC) -p $(NAME) down

clean :
	docker-compose -f $(SRC) -p $(NAME) down --remove-orphans --volumes --rmi all

fclean : clean
	docker volume prune -f
	docker container prune -f
	docker image prune -f
	rm -fr $(DATA_DIR)

re : fclean all

.PHONY : all up obj_folder down clean fclean re