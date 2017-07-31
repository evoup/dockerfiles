#!/bin/sh


cat /tmp/hosts >> /etc/hosts
cp -r /etc/hadoop/conf.empty /etc/hadoop/conf.my_cluster
alternatives --install /etc/hadoop/conf hadoop-conf /etc/hadoop/conf.my_cluster 50
alternatives --set hadoop-conf /etc/hadoop/conf.my_cluster
mkdir -p /data/1/dfs/dn /data/2/dfs/dn /data/3/dfs/dn /data/4/dfs/dn
chown -R hdfs:hdfs /data/1/dfs/dn /data/2/dfs/dn /data/3/dfs/dn /data/4/dfs/dn
/usr/sbin/sshd -D

