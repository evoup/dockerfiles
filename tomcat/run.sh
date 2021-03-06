#!/bin/sh
#-Djava.rmi.server.hostname=10.1.1.118 is host ip, not docker container ip
docker run -i -t -p 8200:8080 \
    -p 9090:9090 \
    --name tomcat \
    -e CATALINA_OPTS="-Djava.rmi.server.hostname=172.16.30.221 \
    -Dcom.sun.management.jmxremote \
    -Dcom.sun.management.jmxremote.port=9090 \
    -Dcom.sun.management.jmxremote.ssl=false \
    -Dcom.sun.management.jmxremote.authenticate=false \
    -Dcom.sun.management.jmxremote.rmi.port=9090" \
    -d tomcat:8.0
