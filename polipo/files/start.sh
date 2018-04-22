#!/bin/sh
#polipo proxyAddress=${PROXY_ADDRESS} \
       #socksParentProxy=${SOCKS_PARENT_PROXY} \
       #socksProxyType=${SOCKS_PROXY_TYPE} \
       #proxyPort=${PROXY_PORT} \
       #dnsNameServer=${DNS_NAME_SERVER}
polipo proxyAddress=0.0.0.0 \
       socksParentProxy=${SOCKS_PARENT_PROXY} \
       socksProxyType=socks5 \
       proxyPort=8124 \
       dnsNameServer=${DNS_NAME_SERVER}
