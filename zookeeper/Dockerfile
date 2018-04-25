# Run zookeeper in a container
#
#docker run --name zk1 --privileged=true -p2203:22 -p28050:18050  -ti -d --ip 172.18.0.50 --net b0 --hostname zk1 evoup/zookeeper 1
#docker run --name zk2 --privileged=true -p2204:22 -p28051:18050  -ti -d --ip 172.18.0.51 --net b0 --hostname zk2 evoup/zookeeper 2
#docker run --name zk3 --privileged=true -p2205:22 -p28052:18050  -ti -d --ip 172.18.0.52 --net b0 --hostname zk3 evoup/zookeeper 3



#docker run --name zk1 --privileged=true -p28050:18050  -ti -d --ip 172.18.0.50 --net b0 --hostname zk1 evoup/zookeeper 1
#docker run --name zk2 --privileged=true -p28051:18050  -ti -d --ip 172.18.0.51 --net b0 --hostname zk2 evoup/zookeeper 2
#docker run --name zk3 --privileged=true -p28052:18050  -ti -d --ip 172.18.0.52 --net b0 --hostname zk3 evoup/zookeeper 3
#(which last 1 is zookeeper`s myid, we can change it for our purpose.)

# Base docker image


FROM centos:6.9
LABEL maintainer "evoup <evoex123@gmail.com>"
ADD CentOS-Base.repo /etc/yum.repos.d/ 
RUN yum -y update
RUN yum -y install openssh-server openssh-clients wget

RUN cd /etc/yum.repos.d/ && wget https://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/cloudera-cdh5.repo
RUN yum -y update

RUN echo 'root:centos' |chpasswd
RUN service sshd start

RUN rm -f /etc/bashrc

ADD files/color_prompt /etc/color_prompt
ADD files/bashrc /etc/bashrc
ADD files/.bashrc /root/.bashrc
ADD files/.bash_profile /root/.bash_profile

# 18050 is jmx port
EXPOSE 2181 2888 3888 18050

RUN yum -y clean all
RUN yum -y install java-1.7.0-openjdk zookeeper zookeeper-server && mkdir -p /var/lib/zookeeper && chown -R zookeeper /var/lib/zookeeper/

ADD files/hosts /tmp/hosts


ADD files/start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
CMD []
