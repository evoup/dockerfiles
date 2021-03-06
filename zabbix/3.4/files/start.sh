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
RESULT=`mysqlshow --user=zabbix --password=zabbix zabbix | grep -o zabbix`
if [ "$RESULT" == "zabbix" ]; then
    echo "already inited" 
else
    mysql --user=root --password=zabbix -e "create database zabbix character set utf8 collate utf8_bin;create user zabbix@localhost identified by 'password';grant all privileges on zabbix.* to zabbix@localhost;"
    zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p zabbix
    echo "DBPassword=zabbix" >> /etc/zabbix_server.conf
    echo "# JavaGateway的所在服务器IP地址" >> /etc/zabbix_server.conf
    echo "JavaGateway=127.0.0.1" >> /etc/zabbix_server.conf
    echo "# JavaGateway的服务端口" >> /etc/zabbix_server.conf 
    echo "JavaGatewayPort=10052" >> /etc/zabbix_server.conf
    echo "# 从javaGateway采集数据的进程数" >> /etc/zabbix_server.conf 
    echo "StartJavaPollers=5" >> /etc/zabbix_server.conf
    #echo "# 监听地址" >> /etc/zabbix/zabbix_java_gateway.conf 
    #echo "LISTEN_IP=0.0.0.0" >> /etc/zabbix/zabbix_java_gateway.conf 
    #echo "# 监听端口" >> /etc/zabbix/zabbix_java_gateway.conf 
    #echo "LISTEN_PORT=10052" >> /etc/zabbix/zabbix_java_gateway.conf 
    #echo "# PID_FILE文件" >> /etc/zabbix/zabbix_java_gateway.conf 
    #echo "PID_FILE=\"/var/run/zabbix/zabbix_java.pid\"" >> /etc/zabbix/zabbix_java_gateway.conf 
    #echo "# 开启的工作线程数" >> /etc/zabbix/zabbix_java_gateway.conf 
    #echo "START_POLLERS=50" >> /etc/zabbix/zabbix_java_gateway.conf 
    #echo "# 超时时间" >> /etc/zabbix/zabbix_java_gateway.conf 
    #echo "TIMEOUT=3" >> /etc/zabbix/zabbix_java_gateway.conf 
fi
systemctl enable zabbix-server zabbix-agent httpd
systemctl restart zabbix-server zabbix-agent httpd
#/etc/init.d/zabbix-server start
# because of zabbix javaGateway always can not start, just use this rode way
#rm -rf /var/run/zabbix/zabbix_java.pid
#/etc/init.d/zabbix-java-gateway start
#/etc/init.d/httpd start

/usr/sbin/sshd -D
