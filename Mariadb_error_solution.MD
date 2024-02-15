ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/run/mysqld/mysqld.sock' (2):

1. `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mariadb'
get IP `127.28.0.3` // `172.29.0.2` // etc
'docker exec -it mariadb /bin/bash'
'mysql -u root -p'
'GRANT ALL PRIVILEGES ON *.* TO 'yli'@'1facbb76928d' IDENTIFIED BY '123456' WITH GRANT OPTION;
FLUSH PRIVILEGES;'
'EXIT;`
'mysql -u yli -p -h 172.28.0.3 -P 3306'

or

2. get the src_network IP,give this IP privilege in mariadb, then check it with mariadb IP:
'docker inspect -f '{{.NetworkSettings.Networks}}' mariadb'
map[src_network:0xc0000ec000]
'docker network inspect src_network'
[
    {
        "Name": "src_network",
        "Id": "479f8071c9e38bfa4fa7a9e35c01d8592a42eaef4d9917d6952ca88b4df2dcfd",
        "Created": "2024-02-11T18:36:29.07836496+01:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.29.0.0/16",
                    "Gateway": "172.29.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": true,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "41e108727eb6c56c2359c12e378baeeb6ba1d4b7460f8af635ddae022e8632d5": {
                "Name": "mariadb",
                "EndpointID": "4305e7fe30defcef7639a6fbca484b5dddbd19c636cd6aaf74ca247319208f21",
                "MacAddress": "02:42:ac:1d:00:02",
                "IPv4Address": "172.29.0.2/16",
                "IPv6Address": ""
            },
            "685c4dc54731f65e4e4cbabd85aa7afd552010bfe56290893a81ed7b56eb0198": {
                "Name": "nginx",
                "EndpointID": "9ee4d044486729f2d94579c8da4b3871ba283b328d5de17c5024afe2f5912d8a",
                "MacAddress": "02:42:ac:1d:00:03",
                "IPv4Address": "172.29.0.3/16",
                "IPv6Address": ""
            },
            "ce7b21e14d13f4881c3a594a884dba489cbefe88da3b469107639f7783e805a3": {
                "Name": "wordpress",
                "EndpointID": "3598eb81c82921f97a65b16ae639231263693e2d6c3ddde6709e48aaf1a6d492",
                "MacAddress": "02:42:ac:1d:00:04",
                "IPv4Address": "172.29.0.4/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {
            "com.docker.compose.network": "network",
            "com.docker.compose.project": "src",
            "com.docker.compose.version": "1.29.2"
        }
    }
]
`docker exec -it mariadb mysql -u root -p -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.29.0.1' IDENTIFIED BY '123456' WITH GRANT OPTION;"
docker exec -it mariadb mysql -u root -p -e "FLUSH PRIVILEGES;"`
'mysql -u root -p -h 172.29.0.2 -P 3306':
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 16
Server version: 10.5.23-MariaDB-0+deb11u1 Debian 11

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.



grant all privileges on *.* to 'root'@'%' identified by 'root' with grant option;
flush privileges;

mysql -u root -p123456 -h127.0.0.1 -P 3306 -D mysql

show databases;