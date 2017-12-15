#Run nginx in a container
# docker run --name nginx --privileged=true -p8006:80 -ti -d --ip 172.18.0.32 --net b0 --hostname nginx evoup/nginx

FROM ubuntu:16.04
LABEL maintainer "evoup <evoex123@gmail.com>"
#RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install nginx

EXPOSE 80
VOLUME ["/var/www/html"]

ADD files/start.sh /start.sh
RUN chmod 755 ./start.sh
CMD ["./start.sh"]

