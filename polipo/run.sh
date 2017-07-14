#!/bin/sh
#docker run -d --name=polipo --net=host chenzhiwei/polipo \
        #proxyAddress=0.0.0.0 socksParentProxy=127.0.0.1:10800 socksProxyType=socks5

docker run -d --name=polipo --net=b0 -p 8123:8123 --hostname=polipo chenzhiwei/polipo \
        proxyAddress=0.0.0.0 socksParentProxy=192.168.31.142:10800 socksProxyType=socks5 proxyPort=8123
