#!/bin/sh
# comment because need install hbase first, and must with jdk8
#docker run --privileged=true --name opentsdb1 -p14243:4242 -ti -d --ip 172.17.0.58 --net b0 --hostname opentsdb1 evoup/hadoop-datanode
#docker exec opentsdb1 yum install -y gnuplot
#docker exec opentsdb1 bash -c "cd /tmp/ && wget -e \"http_proxy=192.168.2.197:8124\" https://github.com/OpenTSDB/opentsdb/releases/download/v2.4.0RC2/opentsdb-2.4.0RC2.noarch.rpm && rpm -ivh opentsdb-2.4.0RC2.noarch.rpm"
