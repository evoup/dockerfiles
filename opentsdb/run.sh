#!/bin/sh
docker run --privileged=true --name opentsdb1 -p14242:4242 -ti -d --ip 172.18.0.58 --net b0 --hostname opentsdb1 evoup/hadoop-datanode
docker exec opentsdb1 yum install -y gnuplot
docker exec opentsdb1 cd /tmp/ && wget https://github.com/OpenTSDB/opentsdb/releases/download/v2.4.0RC2/opentsdb-2.4.0RC2.noarch.rpm && rpm -ivh opentsdb-2.4.0RC2.noarch.rpm
