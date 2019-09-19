#!/bin/sh
docker run -d --restart always --name=grafana -p 3000:3000 grafana/grafana 
