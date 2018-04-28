#!/bin/sh
docker exec namenode1 /bin/sh -c 'for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x start ; done'
docker exec datanode1 /bin/sh -c 'for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x start ; done'
docker exec datanode2 /bin/sh -c 'for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x start ; done'
