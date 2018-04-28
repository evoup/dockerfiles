#!/bin/sh
docker exec datanode2 /etc/init.d/hbase-master start
docker exec datanode1 /etc/init.d/hbase-regionserver start
docker exec datanode2 /etc/init.d/hbase-regionserver start
