#!/bin/sh


echo "server.1=zk_1:2888:3888" >> /etc/zookeeper/conf/zoo.cfg
echo "server.2=zk_2:2888:3888" >> /etc/zookeeper/conf/zoo.cfg
echo "server.3=zk_3:2888:3888" >> /etc/zookeeper/conf/zoo.cfg
#service zookeeper-server init
service zookeeper-server init --force --myid="$@"
service zookeeper-server start

/usr/sbin/sshd -D

