#!/bin/sh
polipo proxyAddress=${PROXY_ADDRESS} \
       socksParentProxy=${SOCKS_PARENT_PROXY} \
       socksProxyType=${SOCKS_PROXY_TYPE} \
       proxyPort=${PROXY_PORT} \
       dnsNameServer=${DNS_NAME_SERVER}
