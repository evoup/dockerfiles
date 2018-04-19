# Run monitoragent2 in a container
# do not use golang over 1.9.x, plugin is unstable
#without proxy: docker build -t evoup/monitoragent2 .
#without proxy and with gitee: docker build -t evoup/monitoragent2 --build-arg use_gitee=1 .
#to use proxy: docker build -t evoup/monitoragent2 --build-arg use_proxy=192.168.101.104:8124 .
#use proxy and with use gitee: docker build -t evoup/monitoragent2 --build-arg use_proxy=192.168.101.104:8124 use_gitee=1 .
##################################################################################
# following command to run:
#docker run --privileged=true --name monitoragent2 -P -ti -d -v ~/projects/gitProjects/monitor_pass/madmonitor2/go/src/madmonitor2:/root/go/src/madmonitor2 --ip 172.18.0.57 --net b0 --hostname montioragent2 evoup/monitoragent2
##################################################################################
# Base docker image


FROM centos:6.9
LABEL maintainer "evoup <evoex123@gmail.com>"
ARG use_proxy
ARG use_gitee


#Other ports
#EXPOSE 22 
RUN yum -y update
RUN yum -y groupinstall Development tools
RUN yum install -y git rsyslog
RUN mkdir /software
RUN if [ "x$use_gitee" = "x" ] ; then cd /software && git clone https://github.com/evoup/monitor_pass.git ; else cd /software && git clone http://evoup:xxx@gitee.com/evoup/monitor_pass.git ; fi
RUN if [ "x$use_proxy" = "x" ] ; then cd /software && curl -O https://dl.google.com/go/go1.9.5.linux-amd64.tar.gz ; else cd /software && curl -x"$use_proxy" -O https://dl.google.com/go/go1.9.5.src.tar.gz ; fi
RUN tar -C /usr/local -xzf /software/go1.9.5.linux-amd64.tar.gz
RUN rm -rf /software/go1.9.5.linux-amd64.tar.gz
ENV GOPATH /root/go
ENV GOBIN /usr/local/go/bin/
ENV PATH $GOBIN:$PATH
RUN go get github.com/antonholmquist/jason
RUN go get github.com/takama/daemon
ADD ./files/golang_pkg/golang.org.bz2 /root/go/src/ 
RUN cd /root/go/src && tar xjf golang.org.bz2
RUN rm -rf golang.org.bz2


#ADD files/start.sh /start.sh
#RUN chmod +x /start.sh
#ENTRYPOINT ["/start.sh"]
#CMD []
