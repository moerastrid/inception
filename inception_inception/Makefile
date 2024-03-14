# # **************************************************************************** #
# #                                                                              #
# #                                                         ::::::::             #
# #    Makefile                                           :+:    :+:             #
# #                                                      +:+                     #
# #    By: ageels <ageels@student.codam.nl>             +#+                      #
# #                                                    +#+                       #
# #    Created: 2024/03/14 16:06:30 by ageels        #+#    #+#                  #
# #    Updated: 2024/03/14 18:57:55 by ageels        ########   odam.nl          #
# #                                                                              #
# # **************************************************************************** #

# NAME = inception
# DOCK_SRC = ./src/docker-compose.yml
# DATA_DIR = /home/ageels/data
# HOST_LINK := "127.0.0.1	ageels.42.fr" > /etc/hosts


# all: $(NAME)

# obj_folder:
# 	mkdir -pv $(DATA_DIR)
# 	mkdir -pv $(DATA_DIR)/database
# 	mkdir -pv $(DATA_DIR)/webfiles

# $(NAME) : obj_folder up
# 	@sudo echo $(HOST_LINK)

# up :
# 	docker-compose -f $(DOCK_SRC) up --build

# down :
# 	docker-compose -f $(DOCK_SRC) down

# clean :
# 	docker-compose -f $(DOCK_SRC) down --rmi "all" --volumes
# 	docker volume prune -f
# 	docker container prune -f
# 	docker image prune -f

# fclean: clean
# 	rm -fr $(DATA_DIR)

# re: fclean all

# .PHONY: all obj_folder down 

NAME	= inception
BLUE	= \033[36m
COLR	= \033[0m



UNAME	:= $(shell uname -s)
ifeq ($(UNAME),Darwin)	#macOS
	DB_PATH		:= ./data
	HOST_LINK	:=
else					#Linux
	DB_PATH		:= /home/ageels/data
	HOST_LINK	:= "127.0.0.1	ageels.42.fr" > /etc/hosts
endif

all		:	$(NAME)

$(NAME)	:
	@echo "inception for $(BLUE)$(UNAME)$(COLR) OS setup start"
	mkdir -p $(DB_PATH)/mariadb/
	mkdir -p $(DB_PATH)/wordpress/
	@sudo echo $(HOST_LINK)
	docker-compose -f ./src/docker-compose.yml up --build

help	: ## 실행가능한 명령을 출력
	@echo " make [command]"
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "$(BLUE) %-5s$(COLR) \t%s\n", $$1, $$2}'

down	: ## 컨테이너들을 일괄 정지
	@echo "Down all"
	docker-compose -f ./src/docker-compose.yml down

clean	: ## 컨테이너를 일괄정지 하고 모든 이미지와 연결된 볼륨 전부 삭제
	docker-compose -f ./src/docker-compose.yml down --rmi "all" --volumes

fclean	: clean ## ⚠️로컬 볼륨 파일까지 전부 삭제
	rm -rf $(DB_PATH)/mariadb/.setup
	rm -rf $(DB_PATH)/mariadb/*
	rm -rf $(DB_PATH)/wordpress/.setup
	rm -rf $(DB_PATH)/wordpress/*

re	: fclean all ## fclean 실행 후 다시 make 실행

.PHONY	: help all down clean fclean re
