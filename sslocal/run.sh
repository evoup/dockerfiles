#!/bin/sh
docker run -d -p 10800:1081 --name sslocal zhenkyle/docker-sslocal \
                -b 0.0.0.0 \
                -s us8.hxfq.in \
                -p 16376 \
                -l 1081 \
                -k password \
                -m rc4-md5

