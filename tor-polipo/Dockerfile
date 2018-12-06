#Tor polipo docker image 
#docker build -t evoup/tor-polipo .
#docker run -itd -p 8118:8118 -p 9050:9050 -p8130:8130 --name tor-polipo evoup/tor-polipo
FROM ubuntu:16.04

LABEL maintainer "evoup <evoex123@gmail.com>"
ARG use_source_mirror
#RUN if [ "x$use_source_mirror" = "x" ] ; then echo not use mirror ; else sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list ; fi
RUN if [ "x$use_source_mirror" = "x" ] ; then echo not use mirror ; else echo 'Acquire::http::Proxy "http://192.168.2.197:8124"' \| tee /etc/apt/apt.conf ; fi
RUN apt-get update
RUN apt-get install tor polipo -y
#9050 tor, 8130 polipo
EXPOSE 9050 8130

ADD files/start.sh /start.sh
ADD files/polipo/config /etc/polipo/config
ADD files/tor/torrc /etc/tor/torrc
RUN chmod 755 ./start.sh
CMD ["./start.sh"]
