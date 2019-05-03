# FastDFS Docker
### 说明
修改自官方[https://github.com/luhuiguo/fastdfs-docker/blob/master/docker-compose.yml]

### 如何使用
直接用
```
docker-compose up --build
```

需要修改的只有一个地方，改成实际的ip
> TRACKER_SERVER=192.168.31.45:22122

### 测试
在使用fdfs_test /etc/fdfs/client.conf upload xxx.jpg之后，返回会example file url: http://192.168.31.45/group1/M00/00/00/wKgfLVy-nQaAGPR0AABFCQjjjng846_big.jpg，注意端口，应该是修改过的8014 ，应该配置在对应的client.conf中，这里就不修改了，仅仅是测试！