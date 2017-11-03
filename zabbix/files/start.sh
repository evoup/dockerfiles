#!/bin/sh

cat /tmp/hosts >> /etc/hosts

/etc/init.d/mysqld start
/usr/bin/mysqladmin -u root password 'zabbix'
mysql --user=root --password=zabbix -e "create database zabbix;"
mysql --user=root --password=zabbix -e "grant all privileges on zabbix.* to zabbix@'%';"
mysql --user=root --password=zabbix -e "flush privileges;"
mysql --user=root --password=zabbix -e "use adsapi;"
mysql --user=root --password=zabbix -e "source /services/software/zabbix-2.2.20/database/mysql/schema.sql;"
mysql --user=root --password=zabbix -e "source /services/software/zabbix-2.2.20/database/mysql/data.sql;"
mysql --user=root --password=zabbix -e "source /services/software/zabbix-2.2.20/database/mysql/images.sql;"

/usr/sbin/sshd -D
