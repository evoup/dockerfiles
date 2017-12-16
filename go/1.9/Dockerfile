# Run go1.9 in a container
#
#docker build -t evoup/go1.9 .

# Base docker image


FROM centos:6.9
LABEL maintainer "evoup <evoex123@gmail.com>"
ARG use_yum_mirror
ADD CentOS-Base.repo /tmp/ 
RUN if [ "x$use_yum_mirror" = "x" ] ; then echo do not use yum mirror ; else mv /tmp/CentOS-Base.repo /etc/yum.repos.d/ ; fi
RUN yum -y update
RUN yum -y install openssh-server openssh-clients wget epel-release sudo
RUN yum -y install libxml2-devel 
RUN yum -y clean all
RUN yum -y groupinstall "Development Tools" "Development Libraries"
RUN yum -y update

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



RUN mkdir -p /services/software
RUN cd /services/software && wget -c https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz
RUN cd /services/software && tar -xvf go1.9.2.linux-amd64.tar.gz
RUN cd /services/software && mv go /usr/local
RUN echo "PATH=\$PATH:/usr/local/go/bin" >> /root/.bashrc


ADD files/hosts /tmp/hosts

ADD files/start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
CMD []
