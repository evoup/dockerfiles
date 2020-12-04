#!/bin/sh
docker run -d -p8004:80 --name openresty -v${PWD}/conf/:/etc/nginx/conf.d/   openresty/openresty:alpine
