FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx
RUN apt-get install openssl

RUN mkdir /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/pdelannoy.crt \
	-keyout /etc/nginx/ssl/pdelannoy.key \
	-subj "/C=FR/ST=Paris/L=Paris/0=42 School/OU=pdelannoy/CN=pdelannoy"

COPY ./nginx.conf /etc/nginx/conf.d

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
