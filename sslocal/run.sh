#!/bin/sh
docker run -d -p 10800:1080 --name sslocal wldf/docker-sslocal \
                -b 0.0.0.0 \
                -s us8.hxfq.in \
                -p 16376 \
                -l 1080 \
                -k password \
                -m rc4-md5

