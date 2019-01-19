#!/bin/sh
docker run -e PASSWORD=password -e METHOD=chacha20 -p 8388:8388 -p 8388:8388/udp -d --restart always shadowsocks/shadowsocks-libev
