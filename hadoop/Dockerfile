# Run hadoop in a container
#
# docker run -d \
#            --hostname namenode1 
#            --name namenode1 
#            --ip=172.18.0.30 --net=b0 
#            evoup/cdh-hadoop-namenode

# Base docker image


#FROM debian:jessie
FROM centos:6.9
LABEL maintainer "evoup <evoex123@gmail.com>"
ADD CentOS-Base.repo /etc/yum.repos.d/ 
RUN yum -y update
RUN yum -y install openssh-server openssh-clients wget

RUN cd /etc/yum.repos.d/ && wget https://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/cloudera-cdh5.repo
RUN yum -u update

RUN echo 'root:centos' |chpasswd
RUN service sshd start

RUN rm -f /etc/bashrc

ADD files/color_prompt /etc/color_prompt
ADD files/bashrc /etc/bashrc
ADD files/.bashrc /root/.bashrc
ADD files/.bash_profile /root/.bash_profile

EXPOSE 22

RUN yum -y clean all
RUN yum -y install zookeeper zookeeper-server && mkdir -p /var/lib/zookeeper && chown -R zookeeper /var/lib/zookeeper/
RUN yum -y install hadoop-yarn-resourcemanager
RUN yum -y install hadoop-hdfs-namenode




CMD /usr/sbin/sshd -D
