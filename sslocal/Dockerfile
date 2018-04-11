FROM jreckner/docker-libsodium:1.0.10
MAINTAINER Fang Qiuming <fangqiuming@outlook.com>

RUN apt-get update && \
    apt-get install -y python-pip
RUN pip install shadowsocks==2.8.2
RUN echo /usr/local/lib > /etc/ld.so.conf.d/usr_local_lib.conf && ldconfig

# Configure container to run as an executable
ENTRYPOINT ["/usr/local/bin/sslocal"]
