# Run madmonitor in a container
#
#docker run --privileged=true --name madmonitor -p2210:22 -p18123:18123 -ti -d --ip 172.18.0.57 --net b0 --hostname madmonitor evoup/madmonitor
#docker build -t evoup/madmonitor .

# Base docker image


FROM centos:6.9
LABEL maintainer "evoup <evoex123@gmail.com>"
ADD CentOS-Base.repo /etc/yum.repos.d/ 
RUN yum -y update
RUN yum -y install openssh-server openssh-clients wget epel-release sudo
RUN yum -y clean all
RUN yum -y groupinstall "Development Tools" "Development Libraries"
RUN yum -y update

RUN yum -y update

RUN echo 'root:centos' |chpasswd
RUN service sshd start

RUN rm -f /etc/bashrc

ADD files/color_prompt /etc/color_prompt
ADD files/bashrc /etc/bashrc
ADD files/.bashrc /root/.bashrc
ADD files/.bash_profile /root/.bash_profile

EXPOSE 22

RUN yum -y clean all

RUN yum update -y libselinux

# passwordless ssh
RUN rm /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys


ADD ./files/ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config
RUN chown root:root /root/.ssh/config

RUN sed  -i "/^[^#]*UsePAM/ s/.*/#&/"  /etc/ssh/sshd_config
RUN echo "UsePAM no" >> /etc/ssh/sshd_config
RUN echo "Port 2122" >> /etc/ssh/sshd_config 
# starting ssh on port 2122 in order to support --net=host



RUN yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel libxml2-devel
RUN mkdir -p /services/software
RUN wget http://museum.php.net/php5/php-5.2.10.tar.bz2 -O /services/software/php-5.2.10.tar.bz2 && cd /services/software && tar xjf php-5.2.10.tar.bz2 
RUN cd /services/software/php-5.2.10 && './configure' '--prefix=/usr/local/php5.2.10_cli' '--disable-cgi' '--enable-mbstring=all' '--enable-pcntl' '--enable-dba' '--enable-sysvmsg' '--enable-sysvshm' '--enable-sockets' '--enable-sigchild' '--enable-ftp' '--enable-embed' && make -j2 && make install

#RUN yum -y install xerces-c xerces-c-devel libgcc gcc gcc-c++ boost141* libgc*  boost-devel
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
