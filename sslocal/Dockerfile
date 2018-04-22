FROM jreckner/docker-libsodium:1.0.10
MAINTAINER evoup <evoex123@gmail.com>

RUN apt-get update && \
    apt-get install -y python-pip
RUN pip install shadowsocks==2.8.2
RUN echo /usr/local/lib > /etc/ld.so.conf.d/usr_local_lib.conf && ldconfig
ENV BIND_ADDRESS="0.0.0.0"
ENV SS_SERVER_ADDRESS="111.111.111.111"
ENV SS_SERVER_PORT="11111"
ENV SOCKS5_PORT="1081"
ENV SS_PASSWORD="passwd"
ENV ENCRYPTION_METHOD="aes-256-cfb"

EXPOSE 1081

# Configure container to run as an executable

ADD files/start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
CMD []
