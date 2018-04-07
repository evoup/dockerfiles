#!/bin/sh

#before run hadoop hdfs, copy conf.my_cluster to machine dir, conf.my_cluster is Customizing Configuration Files


docker cp customizedConf/namenode1/etc/hadoop/conf.my_cluster namenode1:/etc/hadoop/
#docker cp customizedConf/namenode1/etc/hbase/conf namenode1:/etc/hbase/


docker cp customizedConf/datanode1/etc/hadoop/conf.my_cluster datanode1:/etc/hadoop/
#docker cp customizedConf/datanode1/etc/hbase/conf datanode1:/etc/hbase/

docker cp customizedConf/datanode2/etc/hadoop/conf.my_cluster datanode2:/etc/hadoop/
#docker cp customizedConf/datanode2/etc/hbase/conf datanode2:/etc/hbase/


