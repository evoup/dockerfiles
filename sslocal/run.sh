#!/bin/sh
docker run -d -p 10800:1081 --name sslocal zhenkyle/docker-sslocal \
                -b 0.0.0.0 \
                -s 45.78.40.187 \
                -p 19388 \
                -l 1081 \
                -k password \
                -m aes-256-cfb 

