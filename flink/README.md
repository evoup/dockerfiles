flink官方docker

这就是个standalone的模式,所以可以看到有明显的job manager的单点问题
默认docker-compose up就能运行，如果要扩容

```bash
docker-compose scale taskmanager=<N>
```

但是这个方法已经过时了，可以这么用

```bash
docker-compose up --scale taskmanager=<N>
```

管理界面的地址localhost:8081
