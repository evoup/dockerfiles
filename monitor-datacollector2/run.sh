#!/bin/sh
docker run -ti -d --name monitor_data_collector --net b0 -p8090:8090 evoup/jvm /bin/sh
