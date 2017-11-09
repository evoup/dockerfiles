# Run madmonitor in a container
#
#docker run --privileged=true --name madmonitor -p2210:22 -p18123:18123 -ti -d --ip 172.18.0.57 --net b0 --hostname madmonitor evoup/madmonitor
#docker build -t evoup/madmonitor .

# Base docker image


FROM evoup/php5.2.10
LABEL maintainer "evoup <evoex123@gmail.com>"


RUN yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel libxml2-devel

RUN yum -y install xerces-c xerces-c-devel libgcc gcc gcc-c++ libgc*

#Other ports
EXPOSE 2210 18123  

ADD files/rpms/ /services/software/rpms/
RUN rpm -ivh /services/software/rpms/boost-license1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_context1_55_0-1.55.0-1.x86_64.rpm
RUN yum -y install libicu gc-devel
RUN rpm -ivh /services/software/rpms/libboost_regex1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_atomic1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_system1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_chrono1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_coroutine1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_date_time1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_filesystem1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_graph1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_iostreams1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_thread1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_locale1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_log1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_math1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_program_options1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_python1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_random1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_serialization1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_signals1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_test1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_timer1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/libboost_wave1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh /services/software/rpms/boost-devel-1.55.0-1.x86_64.rpm
RUN wget https://codeload.github.com/evoup/phc/zip/master -O /services/software/phc.zip
RUN cd /services/software/ && unzip phc.zip
RUN cd /services/software/phc-master && ./configure --with-php=/usr/local/php5.2.10_cli/ --with-boost-libdir=/usr/lib64/
RUN cd /services/software/phc-master && make -j2 && make install

ADD files/hosts /tmp/hosts

ADD files/start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
CMD []
