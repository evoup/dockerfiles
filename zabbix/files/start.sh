#!/bin/sh

cat /tmp/hosts >> /etc/hosts

/etc/init.d/mysqld start
/usr/bin/mysqladmin -u root password 'zabbix'
#mysql --user=root --password=zabbix -e "create database zabbix;"
#mysql --user=root --password=zabbix -e "grant all privileges on zabbix.* to zabbix@'%';"
#mysql --user=root --password=zabbix -e "flush privileges;"
#mysql --user=root --password=zabbix -e "use zabbix;source /services/software/zabbix-2.2.20/database/mysql/schema.sql;"
#mysql --user=root --password=zabbix -e "use zabbix;source /services/software/zabbix-2.2.20/database/mysql/data.sql;"
#mysql --user=root --password=zabbix -e "use zabbix;source /services/software/zabbix-2.2.20/database/mysql/images.sql;"
#cd /services/software/zabbix-2.2.20/ && ./configure --prefix=/usr/local/zabbix --enable-server --enable-agent --enable-proxy --with-mysql --enable-net-snmp --with-libcurl --enable-java
#make && make install
mysql --user=root --password=zabbix -e "create database zabbix character set utf8 collate utf8_bin;"
mysql --user=root --password=zabbix -e "grant all privileges on zabbix.* to zabbix@localhost identified by 'zabbix';"
mysql --user=root --password=zabbix -e "use zabbix;source /usr/share/doc/zabbix-server-mysql-2.2.0/create/schema.sql;"
mysql --user=root --password=zabbix -e "use zabbix;source /usr/share/doc/zabbix-server-mysql-2.2.0/create/data.sql;"
mysql --user=root --password=zabbix -e "use zabbix;source /usr/share/doc/zabbix-server-mysql-2.2.0/create/images.sql;"

/usr/sbin/sshd -D