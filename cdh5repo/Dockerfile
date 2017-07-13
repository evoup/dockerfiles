# Run cdh5repo httpserver in a container
#withoutproxy: docker build -t evoup/cdh5repo . 
#to use proxy: docker build -t evoup/cdh5repo --build-arg HTTP_PROXY=172.18.0.1:8123 --build-arg HTTPS_PROXY=172.18.0.1:8123 .
 
#(after build, docker exec -it cdh5repo /bin/bash
#then type sh: 
# $export all_proxy=xxx.xxx.xxx.xxx:8123
# $yum -y update
# $cd /var/www/html
# $reposync -r cloudera-cdh5 
#[### this version of nginx web dir is /usr/share/nginx/html/###]
# > [Put all the RPMs into a directory served by your web server, such as /var/www/html/cdh/5/RPMS/noarch/ (or x86_64 or i386 instead of noarch). The directory structure 5/RPMS/noarch is required. Make sure you can remotely access the files in the directory using HTTP, using a URL similar to http://<yourwebserver>/cdh/5/RPMS/).]
#On your web server, issue the following command from the 5/ subdirectory of your RPM directory:
# $createrepo .
#)
#docker run -ti -d --ip 172.18.0.49 --net b0 -v /home/evoup/project/dockerRelative:/var/www/html/ -p 8003:80 --hostname cdh5repo --name cdh5repo evoup/cdh5repo
#while building hadoop image, it will visit host`s 8003 port to fetch cdh package, and the speed is so fast:)

# Base docker image

FROM centos:6.9
RUN yum -y clean all
RUN yum -y update
LABEL maintainer "evoup <evoex123@gmail.com>"
#ADD CentOS-Base.repo /etc/yum.repos.d/ 
RUN yum -y update
RUN yum -y install openssh-server openssh-clients wget epel-release
RUN yum -y update
RUN yum -y install nginx wget 
RUN cd /etc/yum.repos.d/ && wget https://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/cloudera-cdh5.repo -O cloudera-cdh5.repo 
RUN yum -y update 
RUN yum -y install yum-utils createrepo

EXPOSE 80

ADD files/start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh
CMD ["/tmp/start.sh"]

