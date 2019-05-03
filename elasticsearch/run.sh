#!/bin/sh
docker pull elasticsearch:5.6.15
docker network create es-network
docker run -d --name elasticsearch --net es-network -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:5.6.15

