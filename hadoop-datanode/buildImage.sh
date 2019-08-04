#!/bin/sh
network=$1
if [ -z "$network" ] ; then
    echo "must provide a parameter for network, such as b0 or bridge"
	exit
fi
echo "network: ${network}"
#local_port=`docker ps|grep cdh5repo|sed 's/.*0.0.0.0://g'|sed 's/->.*//g'`
local_port=32770
echo "find cdh5repo local port: ${local_port}"
docker build --network ${network} -t evoup/hadoop-datanode --build-arg CDH5REPO_LOCAL_PORT=${local_port} . 
