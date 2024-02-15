all: up
	make run
up:
	@docker pull wordpress
	@docker pull mysql:latest
run:
	docker network create mynetwork
	docker run -it --name mywordpress -p 9999:80  --network=mynetwork -d wordpress 
	docker run --name mysql -e MYSQL_ROOT_PASSWORD=123456  --network=mynetwork -v var/lib/mysql -d mysql
down:
	@docker stop mywordpress
	@docker rm mywordpress
	@docker stop mysql
	@docker rm mysql
	@docker network rm mynetwork

exec:
	docker exec -it mysql bash
test:
	google-chrome http://localhost:9999


