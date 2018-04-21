# Run go1.9 in a container
#
#docker build -t evoup/go1.9:ubuntu14.04 .

# Base docker image


FROM ubuntu:14.04
LABEL maintainer "evoup <evoex123@gmail.com>"
ARG use_source_mirror

RUN if [ "x$use_source_mirror" = "x" ] ; then echo not use yum mirror ; else sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list ; fi
RUN apt-get update
RUN apt-get install vim git build-essential autoconf wget openssh-server -y 



ADD files/color_prompt /etc/color_prompt
ADD files/bashrc /etc/bashrc
ADD files/.bashrc /root/.bashrc
ADD files/.bash_profile /root/.bash_profile

EXPOSE 22

ADD ./files/ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config
RUN chown root:root /root/.ssh/config


RUN mkdir -p /services/software
RUN cd /services/software && wget -c https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz
RUN cd /services/software && tar -xvf go1.9.2.linux-amd64.tar.gz
RUN cd /services/software && mv go /usr/local
RUN echo "PATH=\$PATH:/usr/local/go/bin" >> /root/.bashrc


#ADD files/hosts /tmp/hosts

ADD files/start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
CMD []
