up:
	mkdir -p ${HOME}/data/wordpress
	mkdir -p ${HOME}/data/mysql
	docker compose --env-file ./srcs/.env -f ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down

re:
	$(MAKE) down
	$(MAKE) up

clean:
	docker compose -f ./srcs/docker-compose.yml down --rmi all --volumes
	docker volume prune


fclean:
	$(MAKE) clean
	sudo rm -rf ${HOME}/data/mysql ${HOME}/data/wordpress