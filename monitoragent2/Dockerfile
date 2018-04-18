# Run monitoragent2 in a container
# do not use golang over 1.9.x, plugin is unstable
#without proxy: docker build -t evoup/monitoragent2 .
#to use proxy: docker build -t evoup/monitoragent2 --build-arg use_proxy=192.168.199.143:8124 .
##################################################################################
# following command to run:
#docker run --privileged=true --name monitoragent2 -P -ti -d --ip 172.18.0.57 --net b0 --hostname montioragent2 evoup/monitoragent2
##################################################################################
# Base docker image


FROM centos:6.9
LABEL maintainer "evoup <evoex123@gmail.com>"
ARG use_proxy


#Other ports
#EXPOSE 22 
RUN yum -y update
RUN yum install -y git
RUN mkdir -p /services/monitor_deal/ && mkdir -p /software && cd /services/monitor_deal/ && git clone https://github.com/evoup/monitor_pass.git
RUN if [ "x$use_proxy" = "x" ] ; then cd /software && curl -O https://dl.google.com/go/go1.9.5.linux-amd64.tar.gz ; else cd /software && curl -x"$use_proxy" -O https://dl.google.com/go/go1.9.5.src.tar.gz ; fi
RUN tar -C /usr/local -xzf /software/go1.9.5.linux-amd64.tar.gz
RUN rm -rf /software/go1.9.5.linux-amd64.tar.gz
ENV GOPATH /root/go
ENV GOBIN /usr/local/go/bin/
ENV PATH $GOBIN:$PATH

#ADD files/start.sh /start.sh
#RUN chmod +x /start.sh
#ENTRYPOINT ["/start.sh"]
#CMD []
