#docker build -t evoup/python2.7 .
FROM ubuntu:16.04
LABEL maintainer "evoup <evoex123@gmail.com>"
#RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get install -y python2.7 python-pip python-tk
RUN pip install --upgrade pip
RUN pip install matplotlib scipy
