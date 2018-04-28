# Run pkgrepo httpserver in a container
# correspond to cdh version is cdh5.13.0
#without proxy: docker build -t evoup/cdh5repo . 
#to use proxy: docker build -t evoup/cdh5repo --build-arg use_proxy=172.18.0.1:8123 .
#if use yum mirror,docker build -t evoup/cdh5repo --build-arg use_source_mirror=1 .
#which 172.18.0.1 is interface docker0`s ip(if in mac,it mean`s host ip),and run polipo with sslocal on docker.

## If just used predownloaded image
##################################################################################
# following command to run:
# docker pull evoup/pkgrepo
# docker run -ti -d --net b0 --hostname pkgrepo --name pkgrepo evoup/pkgrepo
#while building our docker image, it will visit host`s 80 port to fetch rpm or deb package, and the speed is so fast:)
##################################################################################


# Base docker image

FROM centos:6.9
LABEL maintainer "evoup <evoex123@gmail.com>"
ARG use_proxy
ARG use_source_mirror

RUN yum -y clean all
RUN cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
ADD CentOS-Base.repo /etc/yum.repos.d/ 
RUN if [ "x$use_source_mirror" = "x" ] ; then cp /etc/yum.repos.d/CentOS-Base.repo.bak /etc/yum.repos.d/CentOS-Base.repo ; else echo using yum mirror ; fi   
RUN rm -rf /etc/yum.repos.d/CentOS-Base.repo.bak
RUN yum -y update
RUN yum -y install openssh-server openssh-clients wget epel-release
RUN yum -y update
RUN yum -y install nginx wget 
RUN if [ "x$use_proxy" = "x" ] ; then echo not using proxy ; else export all_proxy="$use_proxy" ; fi
RUN cd /etc/yum.repos.d/ && wget https://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/cloudera-cdh5.repo -O cloudera-cdh5.repo 
RUN yum -y update 
RUN yum -y install yum-utils createrepo

EXPOSE 80

RUN mkdir /usr/share/nginx/html/pkg
ENTRYPOINT ["/etc/init.d/nginx", "start"]
