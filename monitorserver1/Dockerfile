# Run monitorserver1 in a container
#
# docker run -it \
#            --hostname monitorserver_1
#            --name monitorserver_1
#            evoup/monitorserver1 

# Base docker image
FROM debian:jessie
LABEL maintainer "evoup <evoex123@gmail.com>"
ADD http://museum.php.net/php5/php-5.4.45.tar.gz /src/php-5.4.45.tar.gz
ADD http://pecl.php.net/get/proctitle-0.1.2.tgz /src/proctitle-0.1.2.tgz
ADD http://pecl.php.net/get/memcache-2.2.7.tgz /src/memcache-2.2.7.tgz
ADD ftp://alpha.gnu.org/pub/gnu/autoconf/autoconf-2.59d.tar.gz /src/autoconf-2.59d.tar.gz

RUN apt-get update
RUN mkdir -p /services/software/ext
RUN mv /src/php-5.4.45.tar.gz /services/software/
RUN cd /services/software/ && tar xzf php-5.4.45.tar.gz
RUN mv /src/proctitle-0.1.2.tgz /services/software/ext/
RUN cd /services/software/ext && tar xzf proctitle-0.1.2.tgz
RUN cp -r /services/software/ext/proctitle-0.1.2 /services/software/php-5.4.45/ext/proctitle
RUN cd /services/software/ext && tar xzf memcache-2.2.7.tgz
RUN cp -r /services/software/ext/memcache-2.2.7 /services/software/php-5.4.45/ext/memcache
RUN mv /src/autoconf-2.59d.tar.gz /services/software/
RUN cd /services/software && tar xzf autoconf-2.59d.tar.gz
RUN cd /services/software/autoconf-2.59d/ && ./configure && make && make install








