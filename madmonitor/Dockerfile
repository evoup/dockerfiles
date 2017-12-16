# Run madmonitor in a container
#
#docker run --privileged=true --name madmonitor -p2210:22 -p18123:18123 -v/home/evoup/project/gitProject/monitor_pass/madmonitor/scripts:/services/monitor_deal/gitProject -ti -d --ip 172.18.0.57 --net b0 --hostname madmonitor evoup/madmonitor
#docker build -t evoup/madmonitor .

# Base docker image


FROM evoup/phc-over5.2.10
LABEL maintainer "evoup <evoex123@gmail.com>"


RUN yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel libxml2-devel

#Other ports
EXPOSE 2210 18123  

RUN mkdir -p /services/monitor_deal/ && cd /services/monitor_deal/ && git clone https://github.com/evoup/monitor_pass.git
RUN cd /services/monitor_deal/monitor_pass/madmonitor/scripts/ && phc --include -c madmonitor.m -o madmonitor

ADD files/hosts /tmp/hosts

ADD files/start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
CMD []
