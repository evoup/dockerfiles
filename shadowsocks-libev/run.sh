#!/bin/sh
docker run -e PASSWORD=password -p 8388:8388 -p 8388:8388/udp -d --restart always shadowsocks/shadowsocks-libev
