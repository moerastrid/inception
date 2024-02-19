# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: ageels <ageels@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2024/02/19 14:33:15 by ageels        #+#    #+#                  #
#    Updated: 2024/02/19 14:40:18 by ageels        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

SRC = ./src/docker_compose.yml

# include .env

all : up

up:
	docker compose -f $(SRC) up -d 

down:
	docker compose -f $(SRC) down

# down :
#     docker-compose down

# clean :
#     docker-compose down --volumes


.PHONY: all up down