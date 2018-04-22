FROM jreckner/docker-libsodium:1.0.10
MAINTAINER Fang Qiuming <fangqiuming@outlook.com>

RUN apt-get update && \
    apt-get install -y python-pip
RUN pip install shadowsocks==2.8.2
RUN echo /usr/local/lib > /etc/ld.so.conf.d/usr_local_lib.conf && ldconfig
ENV BIND_ADDRESS="0.0.0.0"
ENV SERVER_ADDRESS="111.111.111.111"
ENV SERVER_PORT="11111"
ENV LISTEN_PORT="1081"
ENV PASSWD="passwd"
ENV METHOD="aes-256-cfb"

EXPOSE 1081

# Configure container to run as an executable



ADD files/start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
CMD []
