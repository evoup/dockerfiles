#!/bin/sh
#(may be first create network: docker network create --subnet=172.18.0.0/16 b0)


docker run -d --name=polipo -p 8124:8124 --hostname=polipo -e PROXY_ADDRESS="0.0.0.0" \
                             -e SOCKS_PARENT_PROXY="192.168.1.13:10800" \
                             -e SOCKS_PROXY_TYPE="socks5" \
                             -e PROXY_PORT="8124" \
                             -e DNS_NAME_SERVER="8.8.8.8" \
                             --restart always \
                             --name polipo evoup/polipo

