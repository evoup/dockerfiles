#!/bin/sh

/usr/sbin/sshd -D
service zookeeper-server init --force --myid="$@"
service zookeeper-server start
