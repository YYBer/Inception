all: compose

compose:
	docker-compose -f ./src/docker-compose.yml up --build -d

down:
	docker-compose -f ./src/docker-compose.yml down

exec:
	docker exec -it nginx /bin/bash

logs:
	docker-compose -f ./src/docker-compose.yml logs nginx

prune:
	docker system prune -af

remove_image:
	docker rmi -f nginx

testd:
	google-chrome http://yli.42.fr:8000

testn:
	google-chrome http://127.0.0.1:8000

re: down
	make compose
	clear
	make logs
	make testd
	sleep 5
	make testn