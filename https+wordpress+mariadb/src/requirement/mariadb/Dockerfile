FROM debian:bullseye

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i 's/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

RUN echo "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD" | debconf-set-selections \
    && echo "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD" | debconf-set-selections

COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306

CMD ["mysqld"]