FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx
RUN apt install openssl

RUN mkdir etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/pdelannoy.crt \
	-keyout /etc/nginx/ssl/pdelannoy.key \
	-subj "/C=DE/ST=Berlin/L=Berlin/0=42 School berlin/OU=pdelannoy/CN=pdelannoy"
	
COPY ./nginx.conf /etc/nginx/conf.d

RUN mkdir -p /run/ngix

EXPOSE 80

ENTRYPOINT ["nginx", "g", "daemon off;"]
