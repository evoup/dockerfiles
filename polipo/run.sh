#!/bin/sh
#(first create network: docker network create --subnet=172.18.0.0/16 b0)
#docker run -d --name=polipo --net=host chenzhiwei/polipo \
        #proxyAddress=0.0.0.0 socksParentProxy=127.0.0.1:10800 socksProxyType=socks5

#docker run -d --name=polipo -p 8123:8123 --hostname=polipo evoup/polipo \
#        proxyAddress=0.0.0.0 socksParentProxy=172.17.0.1:10800 socksProxyType=socks5 proxyPort=8123

docker run -d --name=polipo -p 8124:8124 --hostname=polipo evoup/polipo \
        proxyAddress=0.0.0.0 socksParentProxy=172.17.0.1:10800 socksProxyType=socks5 proxyPort=8124
