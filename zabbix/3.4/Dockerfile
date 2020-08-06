# Run zabbix2.2 in a container
#
#(alternative)docker network create --subnet=172.18.0.0/16 b0
#docker run --privileged=true --name zabbix -P -p8010:80 -p2209:22 -p10051:10051 -ti -d --ip 172.18.0.56 --net b0 --hostname zabbix evoup/zabbix
#after run,visit localhost:8010/zabbix,run setup, then use Admin/zabbix account to login. BTW: may be take a few time to init mysql data.
#for using aliyun yum mirror: docker build -t evoup/zabbix --build-arg use_yum_mirror=1 .
#for default such as dockerhub automation: docker build -t evoup/zabbix .

# Base docker image


FROM centos:7.0
LABEL maintainer "evoup <evoex123@gmail.com>"
ARG use_yum_mirror
ADD Centos-7.repo /tmp/ 
RUN if [ "x$use_yum_mirror" = "x" ] ; then echo do not use yum mirror ; else mv /tmp/Centos-7.repo /etc/yum.repos.d/ ; fi
RUN yum -y update
RUN yum -y install openssh-server openssh-clients wget epel-release sudo
RUN yum -y clean all
RUN yum -y groupinstall "Development Tools" "Development Libraries"
RUN rpm -Uvh https://repo.zabbix.com/zabbix/3.0/rhel/7/x86_64/zabbix-release-3.0-1.el7.noarch.rpm
RUN yum -y update
RUN yum install -y curl curl-devel net-snmp snmp net-snmp-devel perl-DBI php-gd php-xml php-bcmath php-mbstring
RUN yum install -y mysql-server mysql-devel java-1.8.0-openjdk-devel
RUN yum install -y zabbix22-server-mysql zabbix22-web-mysql
RUN yum install -y zabbix22-agent
RUN yum install -y zabbix-java-gateway

RUN echo 'root:centos' |chpasswd
RUN service sshd start

RUN rm -f /etc/bashrc

ADD files/color_prompt /etc/color_prompt
ADD files/bashrc /etc/bashrc
ADD files/.bashrc /root/.bashrc
ADD files/.bash_profile /root/.bash_profile

EXPOSE 22 80 10051 3306

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


RUN mkdir -p /services/software/
#RUN wget https://nchc.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/2.2.20/zabbix-2.2.20.tar.gz -O /services/software/zabbix-2.2.20.tar.gz
#RUN cd /services/software && tar xzf zabbix-2.2.20.tar.gz
#Other ports
EXPOSE 80 2122



ADD files/hosts /tmp/hosts

ADD files/start.sh /start.sh
ADD files/php.ini /etc/php.ini
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
