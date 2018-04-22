#!/bin/sh

/usr/local/bin/sslocal \
    -b ${BIND_ADDRESS} \
    -s ${SS_SERVER_ADDRESS} \
    -p ${SS_SERVER_PORT} \
    -l ${SOCKS5_PORT} \
    -k ${SS_PASSWORD} \
    -m ${ENCRYPTION_METHOD} 
