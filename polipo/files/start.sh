#!/bin/sh
#polipo proxyAddress=${PROXY_ADDRESS} \
       #socksParentProxy=${SOCKS_PARENT_PROXY} \
       #socksProxyType=${SOCKS_PROXY_TYPE} \
       #proxyPort=${PROXY_PORT} \
       #dnsNameServer=${DNS_NAME_SERVER}
polipo proxyAddress=0.0.0.0 \
       socksParentProxy=192.168.1.13:10800 \
       socksProxyType=socks5 \
       proxyPort=8124 \
       dnsNameServer=8.8.8.8
