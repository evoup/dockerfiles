#!/bin/sh
#docker run -d --name=polipo --net=host chenzhiwei/polipo \
        #proxyAddress=0.0.0.0 socksParentProxy=127.0.0.1:10800 socksProxyType=socks5

docker run -d --name=polipo --net=b0 -p 8123:8123 --hostname=polipo siji/polipo \
        proxyAddress=0.0.0.0 socksParentProxy=172.17.0.1:10800 socksProxyType=socks5 proxyPort=8123
