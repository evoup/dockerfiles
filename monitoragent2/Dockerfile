# Run monitoragent2 in a container
# do not use golang over 1.9.x, plugin is unstable
#without proxy: docker build -t evoup/monitoragent2 .
#to use proxy: docker build -t evoup/monitoragent2 --build-arg use_proxy=192.168.101.104:8123
##################################################################################
# following command to run:
#docker run --privileged=true --name madmonitor -p2210:22 -p18123:18123 -ti -d --ip 172.18.0.57 --net b0 --hostname montioragent2 evoup/monitoragent2
##################################################################################
# Base docker image


FROM centos:6.9
LABEL maintainer "evoup <evoex123@gmail.com>"
ARG use_proxy


#Other ports
#EXPOSE 2210  

RUN yum install -y git
RUN mkdir -p /services/monitor_deal/ && cd /services/monitor_deal/ && git clone https://github.com/evoup/monitor_pass.git

#ADD files/hosts /tmp/hosts

#ADD files/start.sh /start.sh
#RUN chmod +x /start.sh
#ENTRYPOINT ["/start.sh"]
#CMD []
