**docker-sslocal** with support for Chacha20
==================

This repository forked from [zhenkyle/docker-sslocal](https://hub.docker.com/r/zhenkyle/docker-sslocal/), added support for Chacha20. The container will run a ![SS](http://i.imgur.com/cje394U.png) client and expose a socks5 proxy on a local port.

Quick Start
-----------
Use entrypoint to config your container.

    docker run -d -p $SOCKS5_PORT:$SOCKS5_PORT wldf/docker-sslocal \
                    -b 0.0.0.0 \
                    -s $SS_SERVER_ADDRESS \
                    -p $SS_SERVER_PORT \
                    -l $SOCKS5_PORT \
                    -k $SS_PASSWORD \
                    -m ENCRYPTION_METHOD

　　  
This is a example, socks5 proxy will start listening on port 1080.


    docker run -d -p $1080:$1080 wldf/docker-sslocal \
                    -b 0.0.0.0 \
                    -s 9.9.9.9 \
                    -p 1984 \
                    -l 1090 \
                    -k 1024 \
                    -m chacha20

-----------
For more information, see [zhenkyle/docker-sslocal](https://github.com/zhenkyle/docker-sslocal).