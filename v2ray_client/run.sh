#!/bin/sh
docker run -d -v $(pwd):/etc/v2ray/ --restart always --name v2ray -p1083:1080 evoup/v2ray_client
