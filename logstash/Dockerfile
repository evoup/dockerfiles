#Run logstash nginx kafka demo 
#docker build -t evoup/logstash .
#docker build -t evoup/logstash --build-arg use_source_mirror=1 .
#docker run --privileged=true --name logstash -ti -d -p 8013:80 --net b0 --hostname logstash evoup/logstash 
FROM ubuntu:16.04

LABEL maintainer "evoup <evoex123@gmail.com>"
ARG use_source_mirror
#RUN if [ "x$use_source_mirror" = "x" ] ; then echo not use mirror ; else sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list ; fi
RUN if [ "x$use_source_mirror" = "x" ] ; then echo not use mirror ; else echo 'Acquire::http::Proxy "http://192.168.2.197:8124"' \| tee /etc/apt/apt.conf ; fi
RUN apt-get update
RUN apt-get install nginx openjdk-8-jre wget -y
RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo 'deb http://packages.elastic.co/logstash/2.2/debian stable main' | tee /etc/apt/sources.list.d/logstash-2.2.x.list
RUN apt-get update
RUN apt-get install logstash -y
RUN /opt/logstash/bin/plugin install logstash-output-kafka
