FROM debian:buster

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/auto_config.sh auto_config.sh
RUN chmod +x auto_config.sh

EXPOSE 3306

ENTRYPOINT ["/auto_config.sh"]
CMD ["mysqld", "--bind-address=0.0.0.0"]
