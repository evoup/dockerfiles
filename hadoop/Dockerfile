# Run hadoop in a container
#
# docker run -it \
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
RUN yum -y install openssh-server openssh-clients
RUN echo 'root:centos' |chpasswd
RUN service sshd start

RUN rm -f /etc/bashrc

ADD files/color_prompt /etc/color_prompt
ADD files/bashrc /etc/bashrc
ADD files/.bashrc /root/.bashrc
ADD files/.bash_profile /root/.bash_profile

EXPOSE 22
CMD /usr/sbin/sshd -D
