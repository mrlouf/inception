up:
	mkdir -p ${HOME}/data/wordpress
	mkdir -p ${HOME}/data/mysql
	docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down

clean:
	docker compose -f ./srcs/docker-compose.yml down --rmi all --volumes
	docker volume prune
	sudo rm -rf ${HOME}/data/mysql ${HOME}/data/wordpress

