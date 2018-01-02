#Run android in a container
# docker run --name nginx --privileged=true -p8006:80 -ti -d --ip 172.18.0.32 --net b0 --hostname nginx evoup/android

FROM ubuntu:16.04
LABEL maintainer "evoup <evoex123@gmail.com>"
#RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
#RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update
#RUN mkdir ~/bin
RUN apt-get -y install openjdk-8-jdk
RUN apt-get -y install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip
RUN mkdir ~/bin
RUN PATH=~/bin:$PATH && curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo
RUN mkdir WORKING_DIRECTORY && cd WORKING_DIRECTORY

