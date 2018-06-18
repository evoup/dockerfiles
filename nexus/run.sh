#!/bin/sh
docker pull sonatype/nexus:oss
docker run -d -p 8081:8081 --name nexus sonatype/nexus:oss
