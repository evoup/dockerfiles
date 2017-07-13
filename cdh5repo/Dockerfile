# Run cdh5repo httpserver in a container
#withoutproxy: docker build -t evoup/cdh5repo 
#to use proxy: docker build -t evoup/cdh5repo --build-arg HTTP_PROXY=127.0.0.1:8123 HTTPS_PROXY=127.0.0.1:8123
#docker run --name cdh5repo evoup/cdh5repo
 
#(after build, docker exec -it cdh5repo /bin/bash
#then type sh: 
# $export all_proxy=xxx.xxx.xxx.xxx:8123
# $yum -y update
# $cd /var/www/html
# $reposync -r cloudera-cdh5 
# > [Put all the RPMs into a directory served by your web server, such as /var/www/html/cdh/5/RPMS/noarch/ (or x86_64 or i386 instead of noarch). The directory structure 5/RPMS/noarch is required. Make sure you can remotely access the files in the directory using HTTP, using a URL similar to http://<yourwebserver>/cdh/5/RPMS/).]
# cd /var/www/html/ 
#)

# Base docker image

FROM centos:6.9
RUN yum -y clean all
RUN yum -y update
LABEL maintainer "evoup <evoex123@gmail.com>"
ADD CentOS-Base.repo /etc/yum.repos.d/ 
RUN yum -y update
RUN yum -y install openssh-server openssh-clients wget epel-release
RUN yum -y update
RUN yum -y install nginx wget 
RUN cd /etc/yum.repos.d/ && wget https://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/cloudera-cdh5.repo -O cloudera-cdh5.repo 
RUN yum -y update 
RUN yum -y install yum-utils createrepo

EXPOSE 80

ADD files/start.sh /tmp/start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/tmp/start.sh"]
CMD []
