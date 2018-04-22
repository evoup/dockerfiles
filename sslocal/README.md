**docker-sslocal** with support for Chacha20
==================

This repository forked from [zhenkyle/docker-sslocal](https://hub.docker.com/r/zhenkyle/docker-sslocal/), added support for Chacha20. The container will run a ![SS](http://i.imgur.com/cje394U.png) client and expose a socks5 proxy on a local port.

Quick Start
-----------
Use entrypoint to config your container.

    docker run -d -p $SOCKS5_PORT:$SOCKS5_PORT -e BIND_ADDRESS="0.0.0.0" \
                    -e SS_SERVER_ADDRESS="45.78.40.187" \
                    -e SS_SERVER_PORT="19388" \
                    -e SOCKS5_PORT="1081" \
                    -e SS_PASSWORD="passwd" \
                    -e ENCRYPTION_METHOD="aes-256-cfb" \
                    --name sslocal evoup/sslocal

　　  
This is a example, socks5 proxy will start listening on port 1080.


    docker run -d -p 10800:1081 -e BIND_ADDRESS="0.0.0.0" \
                    -e SS_SERVER_ADDRESS="45.78.40.187" \
                    -e SS_SERVER_PORT="19388" \
                    -e SOCKS5_PORT="1081" \
                    -e SS_PASSWORD="passwd" \
                    -e ENCRYPTION_METHOD="aes-256-cfb" \
                    --name sslocal evoup/sslocal
-----------
For more information, see [zhenkyle/docker-sslocal](https://github.com/zhenkyle/docker-sslocal).
