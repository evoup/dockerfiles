#!/bin/sh


#service zookeeper-server init --force --myid="$@"
service zookeeper-server init
service zookeeper-server start

/usr/sbin/sshd -D

