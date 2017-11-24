#!/bin/sh
#cd /tmp/ && wget https://github.com/OpenTSDB/opentsdb/releases/download/v2.4.0RC2/opentsdb-2.4.0RC2.noarch.rpm && rpm -ivh opentsdb-2.4.0RC2.noarch.rpm
docker run --privileged=true --name opentsdb1 -p14646:4646 -ti -d --ip 172.18.0.58 --net b0 --hostname opentsdb1 evoup/hadoop-datanode
