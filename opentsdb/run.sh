#!/bin/sh
docker run --privileged=true --name opentsdb1 -p14646:4646 -ti -d --ip 172.18.0.58 --net b0 --hostname opentsdb1 evoup/hadoop-datanode
