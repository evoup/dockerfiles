# Run monitoragent2 in a container
#
#docker run --privileged=true --name madmonitor -p2210:22 -p18123:18123 -v/home/evoup/project/gitProject/monitor_pass/madmonitor/scripts:/services/monitor_deal/gitProject -ti -d --ip 172.18.0.57 --net b0 --hostname madmonitor evoup/madmonitor
#docker build -t evoup/monitoragent2 .

# Base docker image


FROM centos:6.9
LABEL maintainer "evoup <evoex123@gmail.com>"


#Other ports
EXPOSE 2210  

RUN yum install -y git
RUN mkdir -p /services/monitor_deal/ && cd /services/monitor_deal/ && git clone https://github.com/evoup/monitor_pass.git

ADD files/hosts /tmp/hosts

ADD files/start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
CMD []
