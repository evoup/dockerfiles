#!/bin/sh

#this should be install after format hdfs and running hadoop

docker exec datanode1 yum install -y hadoop-mapreduce-historyserver hbase-regionserver hbase-thrift

docker exec datanode2 yum install -y hbase-master hbase-regionserver hbase-thrift

docker exec datanode1 alternatives --install /etc/hbase/conf hbase-conf /etc/hbase/conf.my_cluster 50
docker exec datanode1 alternatives --set hbase-conf /etc/hbase/conf.my_cluster

docker exec datanode2 alternatives --install /etc/hbase/conf hbase-conf /etc/hbase/conf.my_cluster 50
docker exec datanode2 alternatives --set hbase-conf /etc/hbase/conf.my_cluster

docker cp customizedConf/namenode1/etc/hbase/conf.my_cluster namenode1:/etc/hbase/

docker cp customizedConf/datanode1/etc/hbase/conf.my_cluster datanode1:/etc/hbase/

docker cp customizedConf/datanode2/etc/hbase/conf.my_cluster datanode2:/etc/hbase/
