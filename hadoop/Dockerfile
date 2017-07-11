# Run hadoop in a container
#
# docker run -it \
#            --hostname namenode1 
#            --name namenode1 
#            evoup/cdh-hadoop-namenode

# Base docker image
#FROM debian:jessie
           --
FROM centos:6
LABEL maintainer "evoup <evoex123@gmail.com>"
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update
