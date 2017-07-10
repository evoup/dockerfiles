# Run monitorserver1 in a container
#
# docker run -it \
#            --hostname monitorserver_1
#            --name monitorserver_1
#            evoup/monitorserver1 

# Base docker image
#FROM debian:jessie
FROM ubuntu:16.04
LABEL maintainer "evoup <evoex123@gmail.com>"
#ADD http://museum.php.net/php5/php-5.4.45.tar.gz /src/php-5.4.45.tar.gz
ADD https://secure.php.net/distributions/php-5.4.45.tar.gz /src/php-5.4.45.tar.gz
ADD http://pecl.php.net/get/proctitle-0.1.2.tgz /src/proctitle-0.1.2.tgz
ADD http://pecl.php.net/get/memcache-2.2.7.tgz /src/memcache-2.2.7.tgz
ADD http://alpha.gnu.org/pub/gnu/autoconf/autoconf-2.59d.tar.gz /src/autoconf-2.59d.tar.gz
ADD http://mirrors.hust.edu.cn/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz /src/zookeeper-3.4.6.tar.gz

RUN sed -i 's/httpredir.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install libmemcache-dev libz-dev libxml2-dev libmemcache-dev build-essential m4 git autoconf libjpeg-dev libpng-dev libcurl4-gnutls-dev libfreetype6-dev libmcrypt-dev wget unzip -y
RUN mkdir -p /services/software/ext
RUN mv /src/php-5.4.45.tar.gz /services/software/
RUN cd /services/software/ && tar xzf php-5.4.45.tar.gz
RUN mv /src/proctitle-0.1.2.tgz /services/software/ext/
RUN cd /services/software/ext && tar xzf proctitle-0.1.2.tgz
RUN cp -r /services/software/ext/proctitle-0.1.2 /services/software/php-5.4.45/ext/proctitle
RUN mv /src/memcache-2.2.7.tgz /services/software/ext/
RUN cd /services/software/ext && tar xzf memcache-2.2.7.tgz
RUN cp -r /services/software/ext/memcache-2.2.7 /services/software/php-5.4.45/ext/memcache
RUN mv /src/autoconf-2.59d.tar.gz /services/software/
RUN cd /services/software && tar xzf autoconf-2.59d.tar.gz
RUN cd /services/software/autoconf-2.59d/ && ./configure && make && make install
RUN autoconf --version
RUN cd /services/software/php-5.4.45 && ./buildconf --force
RUN mv /src/zookeeper-3.4.6.tar.gz /services/software/
RUN cd /services/software/ && tar xzf zookeeper-3.4.6.tar.gz
RUN cd /services/software/zookeeper-3.4.6/src/c && ./configure --prefix=/services/software/zookeeper-3.4.6/prefix/ && make -j$(nproc) && make install
RUN cd /services/software/php-5.4.45/ && './configure' '--prefix=/usr/local/php5_new' '--disable-cgi' '--enable-mbstring=all' '--enable-pcntl' '--enable-dba' '--enable-sysvmsg' '--enable-sysvshm' '--enable-sockets' '-enable-sigchild' '--enable-ftp' '--enable-memcache' '--enable-zookeeper' '--with-libzookeeper-dir=/services/software/zookeeper-3.4.6/prefix/' '--enable-proctitle' '--with-zlib' && make -j$(nproc) && make install
#RUN cd /services/software && git clone git://git.gnome.org/libxml2
#RUN cd /services/software/libxml2/ && 
#RUN cd /services/software/php-5.4.45 && ./buildconf --force


RUN cd /services/software/php-5.4.45/ && make clean && './configure' '--prefix=/usr/local/php5_admin' '--with-layout=GNU' '--with-config-file-scan-dir=/usr/local/php5_admin/etc/php' '--disable-all' '--enable-dom' '--enable-filter' '--enable-hash' '--enable-json' '--with-mcrypt' '--with-curl' '--with-pcre-regex' '--enable-mbstring' '--enable-ctype' '--enable-session' '--with-libxml-dir' '--enable-libxml' '--enable-simplexml' '--enable-pdo' '--with-pdo-mysql=mysqlnd' '--with-mysqli=mysqlnd' '--enable-sysvsem' '--enable-sysvshm' '--enable-memcache' '--enable-fpm' '--enable-pcntl' '--enable-dba' '--enable-dba' '--enable-sysvmsg' '--enable-sysvshm' '--enable-sockets' '--enable-sigchild' '--enable-ftp' '--with-gd' '--enable-gd' '--enable-gd-native-ttf' '--with-jpeg-dir=/usr/local' '--with-png=/usr/local' '--with-ttf' '--with-zlib' '--with-freetype-dir=/usr/local' '--enable-track-vars' '--with-pear=/usr/local/pear' '--enable-xml' '--with-mysql' '--enable-zookeeper' '--with-libzookeeper-dir=/services/software/zookeeper-3.4.6/prefix' && find . -name '*.1' > /tmp/php-1.lst.$$ && tar -cf /tmp/php-1.tar.$$ -T /tmp/php-1.lst.$$ && make clean && tar -xf /tmp/php-1.tar.$$ && rm /tmp/php-1.tar.$$ /tmp/php-1.lst.$$ && make -j$(nproc) && make install
RUN cp /usr/local/php5_admin/etc/php-fpm.conf.default /usr/local/php5_admin/etc/php-fpm.conf
RUN cd /tmp && wget https://codeload.github.com/evoup/dockerfiles/zip/master -O dockerfiles && unzip dockerfiles && cp dockerfiles-master/monitorserver1/php-fpm /etc/init.d/ && chmod +x /etc/init.d/php-fpm && touch /var/run/php-fpm.pid

RUN groupadd nobody

#ENTRYPOINT /etc/init.d/php-fpm start







