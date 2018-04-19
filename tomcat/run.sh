#!/bin/sh
docker run -i -t -p 8200:8080 \
    -p 9090:9090 \
    --name tomcat \
    -e CATALINA_OPTS="-Djava.rmi.server.hostname=192.168.101.104 \
    -Dcom.sun.management.jmxremote \
    -Dcom.sun.management.jmxremote.port=9090 \
    -Dcom.sun.management.jmxremote.ssl=false \
    -Dcom.sun.management.jmxremote.authenticate=false \
    -Dcom.sun.management.jmxremote.rmi.port=9090" \
    -d tomcat:8.0
