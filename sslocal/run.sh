#!/bin/sh
docker run -d -p 10800:1081 -e BIND_ADDRESS="0.0.0.0" \
                            -e SS_SERVER_ADDRESS="45.78.40.187" \
                            -e SS_SERVER_PORT="19388" \
                            -e SOCKS5_PORT="1081" \
                            -e SS_PASSWORD="passwd" \
                            -e ENCRYPTION_METHOD="aes-256-cfb" \
                            --restart always \
                            --name sslocal evoup/sslocal

