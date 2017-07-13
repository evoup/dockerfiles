#!/bin/sh
docker run -d --name=polipo --net=host chenzhiwei/polipo \
        proxyAddress=0.0.0.0 socksParentProxy=127.0.0.1:10800 socksProxyType=socks5
