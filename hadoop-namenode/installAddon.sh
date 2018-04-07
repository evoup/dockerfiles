#!/bin/sh

#this should be install after format hdfs and running hadoop

docker exec datanode1 yum install -y hadoop-mapreduce-historyserver hbase-regionserver hbase-thrift

docker exec datanode2 yum install -y hbase-master hbase-regionserver hbase-thrift
