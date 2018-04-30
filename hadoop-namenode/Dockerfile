# Run hadoop in a container
#first run zk1 zk2 zk3 in zookeeper step
#docker run -ti -d --privileged=true --name namenode1 -p2206:22 -p50070:50070 --ip 172.18.0.53 --net b0 --hostname namenode1 evoup/hadoop-namenode
#docker build --network b0 --link cdh5repo:cdh5repo -t evoup/hadoop-namenode . 

#according this page to configure, and this time we just have a look, we already configed most of all already!
#http://www.cloudera.com/documentation/cdh/5-1-x/CDH5-Installation-Guide/cdh5ig_hdfs_cluster_deploy.html
#Copy the Hadoop configuration[auto]
#Customizing Configuration Files[run copyConf.sh within namenode dockerfile]
#Configuring Local Storage Directories[above done]
#Configuring DataNodes to Tolerate Local Storage Directory Failure[no]
#Formatting the NameNode
# docker exec namenode1 sudo -u hdfs hdfs namenode -format
#Configuring a Remote NameNode Storage Directory[no]
#Configuring the Secondary NameNode[no]
#Enabling Trash[no]
#Configuring Storage-Balancing for the DataNodes[no]
#Enabling WebHDFS[no]
#Configuring LZO[auto]
#Start HDFS
#  Deploy the configuration[auto]
#  each node run:
#    docker exec namenode1 /bin/sh -c 'for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x start ; done'
#    docker exec datanode1 /bin/sh -c 'for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x start ; done'
#    docker exec datanode2 /bin/sh -c 'for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x start ; done'
#  one node run:
#    docker exec namenode1 sudo -u hdfs hadoop fs -mkdir /tmp
#    docker exec namenode1 sudo -u hdfs hadoop fs -chmod -R 1777 /tmp
#install hbase
#  run installAddon.sh 
#  run hbase node:
#    docker exec datanode2 /etc/init.d/hbase-master start
#    docker exec datanode1 /etc/init.d/hbase-regionserver start
#    docker exec datanode1 /etc/init.d/hbase-thrift start
#    docker exec datanode2 /etc/init.d/hbase-regionserver start
#    docker exec datanode2 /etc/init.d/hbase-thrift start


# Base docker image


FROM centos:6.9
LABEL maintainer "evoup <evoex123@gmail.com>"
ADD CentOS-Base.repo /etc/yum.repos.d/ 
RUN yum -y update
RUN yum -y install openssh-server openssh-clients wget epel-release sudo
RUN yum -y update

ADD cloudera-cdh5.repo /etc/yum.repos.d/cloudera-cdh5.repo 
RUN echo baseurl=http://cdh5repo/cdh/5/ >> /etc/yum.repos.d/cloudera-cdh5.repo
RUN curl http://archive.cloudera.com/gplextras5/redhat/5/x86_64/gplextras/cloudera-gplextras5.repo > /etc/yum.repos.d/cloudera-gplextras5.repo
RUN yum -y update

RUN echo 'root:centos' |chpasswd
RUN service sshd start

RUN rm -f /etc/bashrc

ADD files/color_prompt /etc/color_prompt
ADD files/bashrc /etc/bashrc
ADD files/.bashrc /root/.bashrc
ADD files/.bash_profile /root/.bash_profile

EXPOSE 22

RUN yum -y clean all

RUN yum update -y libselinux

# passwordless ssh
RUN rm /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys


ADD ./files/ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config
RUN chown root:root /root/.ssh/config

RUN sed  -i "/^[^#]*UsePAM/ s/.*/#&/"  /etc/ssh/sshd_config
RUN echo "UsePAM no" >> /etc/ssh/sshd_config
RUN echo "Port 2122" >> /etc/ssh/sshd_config 
# starting ssh on port 2122 in order to support --net=host

ADD RPM-GPG-KEY-cloudera /tmp/RPM-GPG-KEY-cloudera
RUN rpm --import /tmp/RPM-GPG-KEY-cloudera


RUN yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel
RUN yum -y install hadoop-yarn-resourcemanager
RUN yum -y install hadoop-hdfs-namenode
RUN yum -y install hadoop-lzo


# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000
# Mapred ports
EXPOSE 10020 19888
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088
#Other ports
EXPOSE 49707 2122



ADD files/hosts /hosts

ADD files/start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
#CMD []
