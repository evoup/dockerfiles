use docker-compose version!

```bash
sysctl -w vm.max_map_count=262144 
```

And for the persistence configuration

```bash
echo "vm.max_map_count=262144" >> /etc/sysctl.conf
```
