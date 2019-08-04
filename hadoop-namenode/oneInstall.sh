#!/bin/bash
dir=$PWD
echo "create network"
docker network create --subnet=172.18.0.0/16 b0
echo "init zk"
docker run --name zk1 --privileged=true -p28050:18050  -ti -d --ip 172.18.0.50 --net b0 --hostname zk1 evoup/zookeeper 1
docker run --name zk2 --privileged=true -p28051:18050  -ti -d --ip 172.18.0.51 --net b0 --hostname zk2 evoup/zookeeper 2
docker run --name zk3 --privileged=true -p28052:18050  -ti -d --ip 172.18.0.52 --net b0 --hostname zk3 evoup/zookeeper 3
echo "init cdh5 repo"
docker run -tid -P --rm --net b0 --hostname cdh5repo --name cdh5repo evoup/cdh5repo
echo "init yum pkg repo server"
docker run -tid -P --rm --net b0 --hostname pkgrepo --name pkgrepo evoup/pkgrepo
if [[ "$(docker images -q evoup/hadoop-namenode:latest 2> /dev/null)" == "" ]]; then
    cd ../hadoop-namenode/ && ./buildImage.sh b0 
fi
echo "install namenode"
docker run --privileged=true --name namenode1 -p50070:50070 -ti -d --ip 172.18.0.53 --net b0 --hostname namenode1 evoup/hadoop-namenode
if [[ "$(docker images -q evoup/hadoop-datanode:latest 2> /dev/null)" == "" ]]; then
    cd ../hadoop-datanode/ && ./buildImage.sh b0 
fi
echo "install datanode"
docker run --privileged=true --name datanode1 -p19888:19888 -p14242:4242 -p9090:9090 -p8090:8090 -P -ti -d --ip 172.18.0.54 --net b0 --hostname datanode1 evoup/hadoop-datanode
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
echo "done"
