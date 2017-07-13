#!/bin/sh


cat /tmp/hosts >> /etc/hosts

/usr/sbin/sshd -D

