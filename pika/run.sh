#!/bin/sh
docker run --name pika -it -p9221:9221 -v $(pwd)/pika.conf:/etc/pika.conf -d pikadb/pika pika -c /etc/pika.conf
