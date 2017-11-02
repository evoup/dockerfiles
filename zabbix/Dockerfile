# Run zabbix2.2 in a container

FROM centos:6.9
LABEL maintainer "evoup <evoex123@gmail.com>"
ADD CentOS-Base.repo /etc/yum.repos.d/
RUN yum -y update
RUN yum -y install openssh-server openssh-clients wget epel-release sudo
RUN yum -y update
RUN yum -y clean all
RUN yum -y groupinstall "Development Tools" "Development Libraries"


ADD files/color_prompt /etc/color_prompt
ADD files/bashrc /etc/bashrc
ADD files/.bashrc /root/.bashrc
ADD files/.bash_profile /root/.bash_profile

EXPOSE 22 80


RUN mkdir -p /services/software/
RUN wget https://nchc.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/2.2.20/zabbix-2.2.20.tar.gz /services/software/zabbix-2.2.20.tar.gz

ADD files/hosts /tmp/hosts
ADD files/start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
CMD []
