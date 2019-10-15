直接使用docker-compose up就可以了

如果像raksmart等无法安装docker-compose的话就下面的目录，然后编辑国家文件

```dockerfile
docker run -d -p 8118:8118 -p 9050:9050 rdsubhas/tor-privoxy-alpine
```

