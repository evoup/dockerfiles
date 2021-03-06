#!/bin/sh

cat /hosts >> /etc/hosts

if [ -d "/usr/share/zooInited" ] ; then
    echo "noop"
else
    echo "server.1=zk1:2888:3888" >> /etc/zookeeper/conf/zoo.cfg
    echo "server.2=zk2:2888:3888" >> /etc/zookeeper/conf/zoo.cfg
    echo "server.3=zk3:2888:3888" >> /etc/zookeeper/conf/zoo.cfg
    echo "maxClientCnxns=200" >> /etc/zookeeper/conf/zoo.cfg
    #echo "export SERVER_JVMFLAGS=\"-Djava.rmi.server.hostname=172.18.0.50 -Dcom.sun.management.jmxremote.port=18050 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false\"" >> /etc/default/zookeeper
    echo "export SERVER_JVMFLAGS=\"-Dcom.sun.management.jmxremote.port=18050 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false\"" >> /etc/default/zookeeper
    #service zookeeper-server init
    service zookeeper-server init --force --myid="$@"
    mkdir -p /usr/share/zooInited
fi
service zookeeper-server start

/usr/sbin/sshd -D

