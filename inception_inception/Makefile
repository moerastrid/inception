# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/03/14 16:06:30 by ageels        #+#    #+#                  #
#    Updated: 2024/03/14 17:26:18 by ageels        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = inception
DOCK_SRC = ./src/docker-compose.yml
DATA_DIR = ~/data
HOST_LINK := "127.0.0.1	ageels.42.fr" > /etc/hosts


all: $(NAME)

obj_folder:
	mkdir -pv $(DATA_DIR)
	mkdir -pv $(DATA_DIR)/database
	mkdir -pv $(DATA_DIR)/webfiles

$(NAME) : obj_folder up

up :
	docker-compose -f $(DOCK_SRC) up --build

down :
	docker-compose -f $(DOCK_SRC) down

clean :
	docker-compose -f $(DOCK_SRC) down --rmi "all" --volumes
	docker volume prune -f
	docker container prune -f
	docker image prune -f

fclean: clean
	rm -fr $(DATA_DIR)

re: fclean all

.PHONY: all obj_folder down 