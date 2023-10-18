all:
	@if ! [ -d "/home/pdelanno/data" ]; then \
		mkdir /home/pdelanno/data; \
		mkdir /home/pdelanno/data/wordpress; \
		mkdir /home/pdelanno/data/mysql; \
		echo "Data volumes created"; \
	fi
	@docker-compose up -d

down:
	@docker-compose down

re:
	@docker-compose up -d

clean:
	@docker system prune -a -f

.PHONY: all re down clean
