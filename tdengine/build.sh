#!/bin/sh
wget https://codeload.github.com/taosdata/TDengine/zip/ver-2.0.8.0
unzip ver-2.0.8.0
cp Dockerfile TDengine-ver-2.0.8.0
cd TDengine-ver-2.0.8.0
docker build -t evoup/tdengine:2.0.8.0 .


#目前没有磁盘用量统计，后续会加。我们的数据默认存放在/var/lib/taos目录下，您可通过du -sh /var/lib/taos查看该文件夹的占用空间。不过这个空间并不完全准确，因为tdengine服务默认会在每个vnode中占用一个log文件，是WAL的日志文件，这个文件大小是固定的，正常关闭服务后这个文件会被删除。因此比较准确的空间统计是在正常停止TDengine服务后运行du -sh /var/lib/taos.
#docker run --name tdengine -d -v$(pwd)/log:/var/log/taos -v$(pwd)/db:/var/lib/taos -p 6030:6030 -p 6020:6020 -p 6031:6031 -p 6032:6032 -p 6033:6033 -p 6034:6034 -p 6035:6035 -p 6036:6036 -p 6037:6037 -p 6038:6038 -p 6039:6039 -p 6040:6040 -p 6041:6041 -p 6042:6042 evoup/tdengine:2.0.3.1

# run docker-compose up
