#!/bin/sh
docker exec namenode1 sudo -u hdfs hadoop fs -mkdir /tmp
docker exec namenode1 sudo -u hdfs hadoop fs -chmod -R 1777 /tmp
