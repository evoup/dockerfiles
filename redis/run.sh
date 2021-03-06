#!/bin/sh
#stand alone mode
#docker run --name some-redis -d redis

#persistent mode
docker run --restart always --name redis -p6379:6379 -d redis redis-server --appendonly yes
