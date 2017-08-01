#!/bin/sh
docker run -d -p 3306:3306 --name mysql --ip 172.18.0.60 --net b0 mysql:latest 
