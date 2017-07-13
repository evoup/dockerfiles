#!/bin/sh
docker run -d -p 10800:1080 wldf/docker-sslocal \
                -b 0.0.0.0 \
                -s us8.hxfq.in \
                -p 16376 \
                -l 1090 \
                -k psword \
                -m rc4-md5
