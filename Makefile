# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nponchon <nponchon@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/28 13:10:42 by nponchon          #+#    #+#              #
#    Updated: 2025/02/28 13:14:39 by nponchon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

up:
	mkdir -p ${HOME}/data/wordpress
	mkdir -p ${HOME}/data/mysql
	docker compose --env-file ./srcs/.env -f ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down --remove-orphans
	docker image prune -f

re:
	$(MAKE) down
	$(MAKE) up

clean:
	docker compose -f ./srcs/docker-compose.yml down --rmi all --volumes --remove-orphan
	docker volume prune


fclean:
	$(MAKE) clean
	sudo rm -rf ${HOME}/data/mysql ${HOME}/data/wordpress