#!/bin/sh

if [ -d "/etc/hadoop/conf.my_cluster" ]
then
    echo "already inited"
else
    cp -r /etc/hadoop/conf.empty /etc/hadoop/conf.my_cluster
    alternatives --install /etc/hadoop/conf hadoop-conf /etc/hadoop/conf.my_cluster 50
    alternatives --set hadoop-conf /etc/hadoop/conf.my_cluster
    mkdir -p /data/1/dfs/nn /nfsmount/dfs/nn
    chown -R hdfs:hdfs /data/1/dfs/nn /nfsmount/dfs/nn
    echo "export JAVA_HOME=/usr/lib/jvm/java" >> /root/.bashrc
fi

cat /hosts >> /etc/hosts
/usr/sbin/sshd -D
