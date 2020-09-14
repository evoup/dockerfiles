#!/bin/sh
docker run --name influxdb -dp 8086:8086 \
      -v $PWD:/var/lib/influxdb \
      influxdb:1.7.0

