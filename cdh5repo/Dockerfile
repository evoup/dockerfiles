# Run cdh5repo httpserver in a container
#without proxy: docker build -t evoup/cdh5repo . 
#to use proxy: docker build -t evoup/cdh5repo --build-arg use_proxy=172.18.0.1:8123 .
#if use yum mirror,docker build -t evoup/cdh5repo --build-arg use_source_mirror=1 .
#which 172.18.0.1 is interface docker0`s ip(if in mac,it mean`s host ip),and run polipo with sslocal on docker.
 
#(after build, docker exec -it cdh5repo /bin/bash
#then type sh: 
# $export all_proxy=xxx.xxx.xxx.xxx:8123
# $yum clean all
# $yum -y update
# $cd /var/www/html
# $reposync -r cloudera-cdh5 
#[### this version of nginx web dir is /usr/share/nginx/html/###]
# > [Put all the RPMs into a directory served by your web server, such as /var/www/html/cdh/5/RPMS/noarch/ (or x86_64 or i386 instead of noarch). The directory structure 5/RPMS/noarch is required. Make sure you can remotely access the files in the directory using HTTP, using a URL similar to http://<yourwebserver>/cdh/5/RPMS/).]
#On your web server, issue the following command from the 5/ subdirectory of your RPM directory:
# $createrepo .
#)
#docker run -ti -d --ip 172.18.0.49 --net b0 -v ~/project/dockerRelative:/var/www/html/ -p 8003:80 --hostname cdh5repo --name cdh5repo evoup/cdh5repo

##################################################################################
# following command for build:
# docker run -ti -d --net b0 --hostname cdh5repo --name cdh5repo evoup/cdh5repo
#while building hadoop image, it will visit host`s 80 port to fetch cdh package, and the speed is so fast:)
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

ADD files/start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh
RUN cd /usr/share/nginx/html/ && reposync -r cloudera-cdh5
RUN mkdir /usr/share/nginx/html/cdh
RUN ln -s /usr/share/nginx/html/cloudera-cdh5/ /usr/share/nginx/html/cdh/5 
RUN cd /usr/share/nginx/html/cdh/5 && createrepo .
CMD ["/tmp/start.sh"]

