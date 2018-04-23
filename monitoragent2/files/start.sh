#!/bin/sh

/etc/init.d/rsyslog start
if [ ! -d "/usr/local/lib/madmonitor2" ]; then
    mkdir -p /usr/local/lib/madmonitor2
    cd /root/go/src/madmonitor2
    go build madmonitor2.go
    go build --buildmode=plugin -o /usr/local/lib/madmonitor2/sysload.so collectors/sysload.go
    go build --buildmode=plugin -o /usr/local/lib/madmonitor2/ifstat.so collectors/ifstat.go
    go build --buildmode=plugin -o /usr/local/lib/madmonitor2/dfstat.so collectors/dfstat.go
    go build --buildmode=plugin -o /usr/local/lib/madmonitor2/procstats.so collectors/procstats.go
fi
/bin/bash
