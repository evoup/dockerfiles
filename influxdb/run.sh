#!/bin/sh
docker run --name influxdb -dp 8086:8086 \
      -v $PWD:/var/lib/influxdb \
      influxdb:1.7.0

# The administrator interface is deprecated as of 1.1.0 and will be removed in 1.3.0. It is disabled by default. If needed, it can still be enabled by setting an environment variable like below:
#docker run --name influxdb -e INFLUXDB_ADMIN_ENABLED=true -d -p 8083:8083 -p 8086:8086 \
      #-v $PWD:/var/lib/influxdb \
      #influxdb:1.7.0
