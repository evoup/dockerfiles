# Run monitoragent2 in a container
# do not use golang over 1.9.x, plugin is unstable
#to build ubuntu version, git checkout master and run build or docker pull evoup/monitoragent2:ubuntu
#without proxy: docker build -t evoup/monitoragent2:ubuntu .
#to use proxy: docker build -t evoup/monitoragent2:ubuntu --build-arg use_proxy=192.168.101.104:8124 .
##################################################################################
# following command to run:
#docker run --privileged=true --name monitoragent2 -P -ti -d -v ~/projects/gitProjects/monitor_pass/madmonitor2/go/src/madmonitor2:/root/go/src/madmonitor2 --ip 172.18.0.57 --net b0 --hostname montioragent2 evoup/monitoragent2:ubuntu
##################################################################################
# Base docker image


FROM evoup/go1.9:ubuntu
LABEL maintainer "evoup <evoex123@gmail.com>"
ARG use_proxy

RUN apt-get update
RUN apt-get install wget -y

#ENV GOPATH /root/go
#ENV GOBIN /usr/local/go/bin/
#ENV PATH $GOBIN:$PATH
#RUN go get github.com/antonholmquist/jason
#RUN go get github.com/takama/daemon
#ADD ./files/golang_pkg/golang.org/ /root/go/src/ 


ENV GOPATH /root/go
ENV GOBIN /usr/local/go/bin/
ENV PATH $GOBIN:$PATH
RUN go get github.com/antonholmquist/jason
RUN go get github.com/takama/daemon
ADD files/golang_pkg/golang.org.bz2 /root/go/src/


#ADD files/start.sh /start.sh
#RUN chmod +x /start.sh
#ENTRYPOINT ["/start.sh"]
#CMD []
