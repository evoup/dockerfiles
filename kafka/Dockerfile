#Run kafka in docker containeRun kafka in docker container
#files/server.properties just different from /opt/kafka/config/server.properties with changing zookeeper.connect=localhost:2181 to zookeeper.connect=zk1:2181,zk2:2181,zk3:2181
#docker build -t evoup/kafka .
#docker run --privileged=true --name kafka -ti -d -p9092:9092 --net b0 --hostname kafka evoup/kafka 
FROM centos:6.9

ARG kafka_version=1.0.0
ARG scala_version=2.12

LABEL maintainer "evoup <evoex123@gmail.com>"
RUN yum -y update
RUN yum install -y epel-release
RUN yum -y update
RUN yum install -y java-1.8.0-openjdk-devel curl wget jq
ENV KAFKA_VERSION=$kafka_version SCALA_VERSION=$scala_version
ADD files/download-kafka.sh /tmp/download-kafka.sh
RUN chmod a+x /tmp/download-kafka.sh && sync && /tmp/download-kafka.sh && tar xfz /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt && rm /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && ln -s /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} /opt/kafka
ADD files/server.properties /opt/kafka/config/server.properties
