#!/bin/sh

#install opentsdb

docker exec datanode1 yum install -y gnuplot wget
docker exec datanode1 bash -c "cd /tmp/ && wget https://github.com/OpenTSDB/opentsdb/releases/download/v2.4.0RC2/opentsdb-2.4.0RC2.noarch.rpm && rpm -ivh opentsdb-2.4.0RC2.noarch.rpm"
