#!/bin/sh

cat /tmp/hosts >> /etc/hosts

/etc/init.d/mysqld start
/usr/bin/mysqladmin -u root password 'zabbix'
/usr/sbin/sshd -D
