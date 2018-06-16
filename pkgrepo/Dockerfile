# Run pkgrepo httpserver in a container
#without proxy: docker build -t evoup/pkgrepo . 
#to use proxy: docker build -t evoup/pkgrepo --build-arg use_proxy=172.18.0.1:8123 .
#if use yum mirror, add --build-arg use_source_mirror=1 for building command

## If just used predownloaded image
##################################################################################
# following command to run:
# docker pull evoup/pkgrepo
# docker run -ti -d -P --net b0 --hostname pkgrepo --name pkgrepo evoup/pkgrepo
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

EXPOSE 80

RUN mkdir /usr/share/nginx/html/pkg
#RUN wget https://github.com/OpenTSDB/opentsdb/releases/download/v2.4.0RC2/opentsdb-2.4.0RC2.noarch.rpm -O /usr/share/nginx/html/pkg/opentsdb-2.4.0RC2.noarch.rpm
RUN wget https://github.com/OpenTSDB/opentsdb/releases/download/v2.3.1/opentsdb-2.3.1.noarch.rpm -O /usr/share/nginx/html/pkg/opentsdb-2.3.1.noarch.rpm 
ADD files/start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
