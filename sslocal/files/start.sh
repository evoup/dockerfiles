#!/bin/sh

/usr/local/bin/sslocal \
    -b ${BIND_ADDRESS} \
    -s ${SERVER_ADDRESS} \
    -p ${SERVER_PORT} \
    -l ${LISTEN_PORT} \
    -k ${PASSWD} \
    -m ${METHOD} 
