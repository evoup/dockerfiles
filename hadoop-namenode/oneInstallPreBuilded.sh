#!/bin/bash
dir=$PWD
echo "create network"
docker network create --subnet=172.18.0.0/16 b0
echo "init zk"
docker run --name zk1 --privileged=true -p12181:2181 -p28050:18050  -ti -d --ip 172.18.0.50 --net b0 --hostname zk1 evoup/zookeeper 1
docker run --name zk2 --privileged=true -p12182:2181 -p28051:18050  -ti -d --ip 172.18.0.51 --net b0 --hostname zk2 evoup/zookeeper 2
docker run --name zk3 --privileged=true -p12183:2181 -p28052:18050  -ti -d --ip 172.18.0.52 --net b0 --hostname zk3 evoup/zookeeper 3
echo "init cdh5 repo"
docker run -tid -p32770:80 --rm --net b0 --hostname cdh5repo --name cdh5repo evoup/cdh5repo
echo "init yum pkg repo server"
docker run -tid -p32771:80 --rm --net b0 --hostname pkgrepo --name pkgrepo evoup/pkgrepo
echo "install namenode"
docker run --privileged=true --name namenode1 -p60070:50070 -ti -d --ip 172.18.0.53 --net b0 --hostname namenode1 evoup/hadoop-namenode
echo "install datanode"
docker run --privileged=true --name datanode1 -p29888:19888 -p14242:4242 -p10090:9090 -p9090:8090 -P -ti -d --ip 172.18.0.54 --net b0 --hostname datanode1 evoup/hadoop-datanode
docker run --privileged=true --name datanode2 -P -ti -d --ip 172.18.0.55 --net b0 --hostname datanode2 evoup/hadoop-datanode
sleep 10
echo "ok"
cd $dir
. include/copyConf.sh
. include/format.sh
. include/startNode.sh
. include/mkTmp.sh
. include/installAddon.sh
. include/startHbaseNode.sh
. include/installOpenTsdb.sh
docker stop pkgrepo cdh5repo
echo "done"
