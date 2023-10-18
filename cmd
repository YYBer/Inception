cd nginx/

docker build -t nginx .

docker run -d -p 80:80 nginx

docker ps

docker exec -it wizardly_solomon /bin/bash

root@e6037d3e07b2:/# cd etc/nginx/conf.d

in container:
cd etc/nginx/conf.d
/etc/nginx/conf.d# vim nginx.conf
/etc/nginx/conf.d# cd /
/# mkdir -p /run/nginx
/# nginx -g "daemon off;"



stop docker:
docker stop admiring_herschel

check running docker:
cd Inception
docker ps
