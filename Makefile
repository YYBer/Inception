all: 
		@if ! [ -d "/home/yli/data" ]; then \
		mkdir /home/yli/data; \
		mkdir /home/yli/data/wordpress; \
		mkdir /home/yli/data/mysql; \
		echo "Data volumes created"; \
	fi
	make compose

compose:
	docker-compose -f ./src/docker-compose.yml up --build  -d

down:
	docker-compose -f ./src/docker-compose.yml down -v

exec:
	docker exec -it nginx /bin/bash

execm:
	docker exec -it mariadb /bin/bash

logs:
	docker-compose -f ./src/docker-compose.yml logs nginx

logsm:
	docker-compose -f ./src/docker-compose.yml logs mariadb

logsw:
	docker-compose -f ./src/docker-compose.yml logs wordpress

prune:
	docker system prune -af

remove_image:
	docker rmi -f nginx

test:
	google-chrome https://127.0.0.1:443

testd:
	google-chrome https://yli.42.fr:443

re: down
	make compose
	sleep 8
	clear
	make logsm
	make test