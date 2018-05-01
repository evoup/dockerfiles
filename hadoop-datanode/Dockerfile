# Run hadoop in a container
#
#docker run --privileged=true --name datanode1 -P -p19888:19888 -ti -d --ip 172.18.0.54 --net b0 --hostname datanode1 evoup/hadoop-datanode
#if installed opentsdb by installOpenTsdb.sh in namenode`s dockefile, run following command to expose opentsdb port 4242 to 14242:
#docker run --privileged=true --name datanode1 -P -p19888:19888 -p14242:4242 -ti -d --ip 172.18.0.54 --net b0 --hostname datanode1 evoup/hadoop-datanode

#docker run --privileged=true --name datanode2 -P -ti -d --ip 172.18.0.55 --net b0 --hostname datanode2 evoup/hadoop-datanode
# 19888 is historyserver e.g. http://datanode1:19888/jobhistory
#use buildImage.sh to build image

# Base docker image


FROM centos:6.9
LABEL maintainer "evoup <evoex123@gmail.com>"
ARG CDH5REPO_LOCAL_PORT
ENV CDH5REPO_LOCAL_PORT=${CDH5REPO_LOCAL_PORT}
ADD CentOS-Base.repo /etc/yum.repos.d/ 
RUN yum -y update
RUN yum -y install openssh-server openssh-clients wget epel-release sudo
RUN yum -y update

ADD cloudera-cdh5.repo /etc/yum.repos.d/cloudera-cdh5.repo 
#RUN echo baseurl=http://cdh5repo/cdh/5/ >> /etc/yum.repos.d/cloudera-cdh5.repo
RUN echo baseurl=http://`/sbin/ip route|awk '/default/ { print $3 }'`:${CDH5REPO_LOCAL_PORT}/cdh/5/ >> /etc/yum.repos.d/cloudera-cdh5.repo
RUN curl http://archive.cloudera.com/gplextras5/redhat/5/x86_64/gplextras/cloudera-gplextras5.repo > /etc/yum.repos.d/cloudera-gplextras5.repo
RUN yum -y update

RUN echo 'root:centos' |chpasswd
RUN service sshd start

RUN rm -f /etc/bashrc

ADD files/color_prompt /etc/color_prompt
ADD files/bashrc /etc/bashrc
ADD files/.bashrc /root/.bashrc
ADD files/.bash_profile /root/.bash_profile

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


RUN yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel hadoop-yarn-nodemanager hadoop-hdfs-datanode hadoop-mapreduce hadoop-lzo

# ssh port
#EXPOSE 2122
# Hdfs ports
#EXPOSE 50010 50020 50070 50075 50090 8020 9000
# Mapred ports
#EXPOSE 10020 19888
# Yarn ports
#EXPOSE 8030 8031 8032 8033 8040 8042 8088
# hbase thrift
#EXPOSE 9090
# Other ports
#EXPOSE 49707 2122
# obligate for opentsdb
#EXPOSE 4242
EXPOSE 2122 50010 50020 50070 50075 50090 8020 9000 10020 19888 8030 8031 8032 8033 8040 8042 8088 9090 49707 2122 4242



ADD files/hosts /hosts

ADD files/start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
