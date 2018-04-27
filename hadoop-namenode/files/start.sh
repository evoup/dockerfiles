#!/bin/sh

if [ -d "/etc/hadoop/conf.my_cluster" ]
    echo "already inited"
then
else
    cat /tmp/hosts >> /etc/hosts
    cp -r /etc/hadoop/conf.empty /etc/hadoop/conf.my_cluster
    alternatives --install /etc/hadoop/conf hadoop-conf /etc/hadoop/conf.my_cluster 50
    alternatives --set hadoop-conf /etc/hadoop/conf.my_cluster
    mkdir -p /data/1/dfs/nn /nfsmount/dfs/nn
    chown -R hdfs:hdfs /data/1/dfs/nn /nfsmount/dfs/nn
    echo "export JAVA_HOME=/usr/lib/jvm/java" >> /root/.bashrc
fi

/usr/sbin/sshd -D
