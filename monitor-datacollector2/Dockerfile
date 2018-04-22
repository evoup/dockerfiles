# Run monitor-datacollector2 in a container
#to build ubuntu version, git checkout master and run build or docker pull evoup/monitor-datacollector2:ubuntu
#without proxy: docker build -t evoup/monitor-datacollector2:ubuntu .
#to use proxy: docker build -t evoup/monitor-datacollector2:ubuntu --build-arg use_proxy=192.168.101.104:8124 .
#without proxy and use source mirrors: docker build -t evoup/monitor-datacollector2:ubuntu --build-arg use_source_mirror=1 .
#to use proxy and use source mirrors: docker build -t evoup/monitor-datacollector2:ubuntu --build-arg use_proxy=192.168.101.104:8124 --build-arg use_source_mirror=1 .

##################################################################################
# following command to run:
#docker run --privileged=true --name monitor-datacollector -P -ti -d --ip 172.18.0.61 --net b0 --hostname montior-datacollector evoup/monitor-datacollector2:ubuntu
##################################################################################
# Base docker image


#FROM ubuntu:14.04
#LABEL maintainer "evoup <evoex123@gmail.com>"
#ARG use_source_mirror
#ARG use_proxy
FROM evoup/jvm






#RUN if [ "x$use_source_mirror" = "x" ] ; then echo not use yum mirror ; else sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list ; fi
#RUN apt-get update
#RUN apt-get install wget -y

#ENV GOPATH /root/go
#ENV GOBIN /usr/local/go/bin/
#ENV PATH $GOBIN:$PATH
#RUN go get github.com/antonholmquist/jason
#RUN go get github.com/takama/daemon
#ADD ./files/golang_pkg/golang.org/ /root/go/src/ 


#ENV GOPATH /root/go
#ENV GOBIN /usr/local/go/bin/
#ENV PATH $GOBIN:$PATH
#RUN go get github.com/antonholmquist/jason
#RUN go get github.com/takama/daemon
#ADD files/golang_pkg/golang.org.bz2 /root/go/src/


#ADD files/start.sh /start.sh
#RUN chmod +x /start.sh
#ENTRYPOINT ["/start.sh"]
#CMD []
