FROM centos:7

LABEL maintainer "luhuiguo@gmail.com"

ENV FASTDFS_PATH=/opt/fdfs \
    FASTDFS_BASE_PATH=/var/fdfs \
    PORT= \
    GROUP_NAME= \
    TRACKER_SERVER=

  

#get all the dependences
RUN yum install -y git gcc make

#create the dirs to store the files downloaded from internet
RUN mkdir -p ${FASTDFS_PATH}/libfastcommon \
 && mkdir -p ${FASTDFS_PATH}/fastdfs \
 && mkdir ${FASTDFS_BASE_PATH}

#compile the libfastcommon
WORKDIR ${FASTDFS_PATH}/libfastcommon

RUN git clone --branch V1.0.36 --depth 1 https://github.com/happyfish100/libfastcommon.git ${FASTDFS_PATH}/libfastcommon \
 && ./make.sh \
 && ./make.sh install \
 && rm -rf ${FASTDFS_PATH}/libfastcommon

#compile the fastdfs
WORKDIR ${FASTDFS_PATH}/fastdfs

RUN git clone --branch V5.11 --depth 1 https://github.com/happyfish100/fastdfs.git ${FASTDFS_PATH}/fastdfs \
 && ./make.sh \
 && ./make.sh install \
 && rm -rf ${FASTDFS_PATH}/fastdfs


EXPOSE 22122 23000 8080 8888
VOLUME ["$FASTDFS_BASE_PATH", "/etc/fdfs"]   

COPY conf/*.* /etc/fdfs/

COPY start.sh /usr/bin/

#make the start.sh executable 
RUN chmod 777 /usr/bin/start.sh

#nginx支持
RUN yum install -y gcc-c++ pcre pcre-devel zlib zlib-devel openssl openssl-devel wget
RUN mkdir /software/ && cd /software && wget -c https://nginx.org/download/nginx-1.12.1.tar.gz && tar zxvf nginx-1.12.1.tar.gz && cd nginx-1.12.1 && ./configure && make && make install 
COPY nginx.conf /usr/local/nginx/conf/


ENTRYPOINT ["/usr/bin/start.sh"]
CMD ["tracker"]
