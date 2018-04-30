#!/bin/sh
network=$1
if [ -z "$network" ] ; then
    echo "must provide a parameter for network, such as b0 or bridge"
	exit
fi
echo "network: ${network}"
local_port=`docker ps|grep cdh5repo|sed 's/.*0.0.0.0://g'|sed 's/->.*//g'`
echo "find cdh5repo local port: ${local_port}"
docker build --network ${network} -t evoup/hadoop-namenode --build-arg cdh5repo_local_port=${local_port} . 
