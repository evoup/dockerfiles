#!/bin/sh

#install opentsdb
#local_port=`docker ps|grep pkgrepo|sed 's/.*0.0.0.0://g'|sed 's/->.*//g'`
local_port=32771
docker_host_ip=`docker exec datanode1 /sbin/ip route|awk '/default/ { print $3 }'`

docker exec datanode1 yum install -y gnuplot
#docker exec datanode1 bash -c "cd /tmp/ && wget https://github.com/OpenTSDB/opentsdb/releases/download/v2.4.0RC2/opentsdb-2.4.0RC2.noarch.rpm && rpm -ivh opentsdb-2.4.0RC2.noarch.rpm"
#docker exec datanode1 bash -c "rpm -ivh http://pkgrepo/pkg/opentsdb-2.4.0RC2.noarch.rpm"
#docker exec datanode1 bash -c "rpm -ivh http://${docker_host_ip}:${local_port}/pkg/opentsdb-2.4.0RC2.noarch.rpm"
docker exec datanode1 bash -c "rpm -ivh http://${docker_host_ip}:${local_port}/pkg/opentsdb-2.3.1.noarch.rpm"
docker exec datanode1 env COMPRESSION=NONE JAVA_HOME=/usr/lib/jvm/java HBASE_HOME=/usr/lib/hbase /usr/share/opentsdb/tools/create_table.sh
docker exec datanode1 sh -c "echo \"tsd.storage.hbase.zk_quorum = \"zk1,zk2,zk3\"\" >> /etc/opentsdb/opentsdb.conf"
docker exec datanode1 sh -c "echo \"tsd.core.auto_create_metrics = true\" >> /etc/opentsdb/opentsdb.conf"
docker exec datanode1 sh -c "/etc/init.d/opentsdb start"
