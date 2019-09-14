#!/bin/sh
. include/startNode.sh
. include/startHbaseNode.sh
sleep 5
docker exec datanode1 sh -c "/etc/init.d/opentsdb start"
docker start kafka

