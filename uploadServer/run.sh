#!/bin/sh
 docker run --privileged=true --name uploadServer -p8005:80 -ti -d --ip 172.18.0.59 --net b0 --hostname uploadServer centos:6.9
