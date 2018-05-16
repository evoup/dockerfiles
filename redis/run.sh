#!/bin/sh
#stand alone mode
#docker run --name some-redis -d redis

#persistent mode
docker run --name redis -d redis redis-server --appendonly yes
