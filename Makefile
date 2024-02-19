# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/02/19 14:33:15 by ageels        #+#    #+#                  #
#    Updated: 2024/02/19 15:29:44 by ageels        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

SRC = ./src/docker-compose.yml

include ./src/.env

all : up

up :
	docker-compose -f $(SRC) up -d 

down :
	docker-compose -f $(SRC) down

clean :
	docker-compose -f $(SRC) down --volumes


.PHONY: all up down clean