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

test:
	google-chrome https://127.0.0.1:443

testd:
	google-chrome https://yli.42.fr:443

re: down
	make compose
	make logs
	make test
	sleep 3
	make testd

.PHONY: all compose down exec logs prune remove_image test testd re