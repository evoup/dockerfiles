#!/bin/sh
docker start pkgrepo
docker run --privileged=true --name namenode1 -p2206:22 -p50070:50070 -ti -d --ip 172.17.0.53 --net b0 --hostname namenode1 evoup/hadoop-namenode
docker run --privileged=true --name datanode1 -p2207:22 -p19888:19888 -p14242:4242 -ti -d --ip 172.17.0.54 --net b0 --hostname datanode1 evoup/hadoop-datanode
docker run --privileged=true --name datanode2 -p2208:22 -ti -d --ip 172.17.0.55 --net b0 --hostname datanode2 evoup/hadoop-datanode
sleep 10
echo "ok"
. include/copyConf.sh
. include/format.sh
. include/startNode.sh
. include/mkTmp.sh
. include/installAddon.sh
. include/startHbaseNode.sh
. include/installOpenTsdb.sh
