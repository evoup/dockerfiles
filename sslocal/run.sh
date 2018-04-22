#!/bin/sh
docker run -d -p 10800:1081 -e BIND_ADDRESS="0.0.0.0" \
                            -e SERVER_ADDRESS="45.78.40.187" \
                            -e SERVER_PORT="19388" \
                            -e LISTEN_PORT="1081" \
                            -e PASSWD="passwd" \
                            -e METHOD="aes-256-cfb" \
                            --name sslocal evoup/sslocal

