NAME = inception

all: prune reload

linux:
	echo "17.0.0.1 yli.42.fr" >> /etc/hosts

stop:
	docker-compose -f srcs/docker-compose.yml down

clean: stop
	rm -rf ~/Desktop/inception

prune: clean
	docker system prune -f

reload:
	docker-compose -f srcs/docker-compose.yml up --build



.PHONY: all prune reload
