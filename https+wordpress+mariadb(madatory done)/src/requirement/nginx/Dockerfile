FROM debian:bullseye


RUN apt update -qq && apt upgrade -y -qq && apt install -y -qq nginx vim curl openssl \
    && mkdir -p /etc/nginx/ssl \
    && openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=DE/ST=BERLIN/L=BERLIN/O=42/OU=42/CN=yli.42.fr/UID=login" \
    && mkdir -p /var/run/nginx \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]