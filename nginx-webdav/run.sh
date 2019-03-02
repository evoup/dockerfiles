#!/bin/sh
docker run --name nginx-webdav -it -p 80:80 -v ./htpasswd:/etc/nginx/htpasswd -v $PWD/data:/data oliverlorenz/docker-nginx-webdav
