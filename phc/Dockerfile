# Run phc in a container
#
#docker build -t evoup/phc .

# Base docker image


FROM evoup/php5.2.10
LABEL maintainer "evoup <evoex123@gmail.com>"


RUN yum -y install xerces-c xerces-c-devel libgcc gcc gcc-c++ libgc*

#Other ports
EXPOSE 2210   

ADD files/rpms/ /services/software/rpms/
RUN rpm -ivh http://repo.enetres.net/x86_64/boost-license1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_context1_55_0-1.55.0-1.x86_64.rpm
RUN yum -y install libicu gc-devel
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_regex1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_atomic1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_system1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_chrono1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_coroutine1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_date_time1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_filesystem1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_graph1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_iostreams1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_thread1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_locale1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_log1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_math1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_program_options1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_python1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_random1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_serialization1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_signals1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_test1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_timer1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/libboost_wave1_55_0-1.55.0-1.x86_64.rpm
RUN rpm -ivh http://repo.enetres.net/x86_64/boost-devel-1.55.0-1.x86_64.rpm
RUN wget https://codeload.github.com/evoup/phc/zip/master -O /services/software/phc.zip
RUN cd /services/software/ && unzip phc.zip
RUN cd /services/software/phc-master && ./configure --with-php=/usr/local/php5.2.10_cli/ --with-boost-libdir=/usr/lib64/
RUN cd /services/software/phc-master && make -j2 && make install

ADD files/hosts /tmp/hosts

ADD files/start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
CMD []
