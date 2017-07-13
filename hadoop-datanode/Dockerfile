# Run hadoop in a container
#
#docker run --name datanode1 -p2207:22 -ti -d --ip 172.18.0.54 --net b0 --hostname datanode1 evoup/hadoop-datanode
#docker run --name datanode2 -p2208:22 -ti -d --ip 172.18.0.55 --net b0 --hostname datanode2 evoup/hadoop-datanode

# Base docker image


FROM centos:6.9
LABEL maintainer "evoup <evoex123@gmail.com>"
ADD CentOS-Base.repo /etc/yum.repos.d/ 
RUN yum -y update
RUN yum -y install openssh-server openssh-clients wget epel-release
RUN yum -y update

#RUN cd /etc/yum.repos.d/ && wget https://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/cloudera-cdh5.repo
ADD cloudera-cdh5.repo /etc/yum.repos.d/cloudera-cdh5.repo 
RUN hostip=$(ip route show | awk '/default/ {print $3}') && echo baseurl=http://${hostip}:8003/cdh/5/ >> /etc/yum.repos.d/cloudera-cdh5.repo
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


RUN yum -y install java-1.7.0-openjdk
RUN yum -y install hadoop-yarn-nodemanager hadoop-hdfs-datanode hadoop-mapreduce


# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000
# Mapred ports
EXPOSE 10020 19888
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088
#Other ports
EXPOSE 49707 2122



ADD files/hosts /tmp/hosts

ADD files/start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
CMD []