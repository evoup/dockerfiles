#!/bin/sh
docker run -d -p 10800:1080 --name sslocal wldf/docker-sslocal --ip 172.18.0.40 --net b0 \
                -b 0.0.0.0 \
                -s us8.hxfq.in \
                -p 16376 \
                -l 1080 \
                -k password \
                -m rc4-md5

#without assign network mode:
#docker run -d -p 10800:1080 --name sslocal wldf/docker-sslocal \
                #-b 0.0.0.0 \
                #-s us8.hxfq.in \
                #-p 16376 \
                #-l 1080 \
                #-k password \
                #-m rc4-md5
