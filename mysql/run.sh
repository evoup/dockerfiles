#!/bin/sh
#docker pull mysql
#docker run -d -p 3306:3306 --name mysql --ip 172.18.0.60 --net b0 mysql
docker run --name mysql -e MYSQL_ROOT_PASSWORD=passwd -d -p3306:3306 mysql
