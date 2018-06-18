#!/bin/sh
docker run -p 8080:8080 -p 50000:50000 --name jenkins --net b0 --hostname jenkins -v /volume1/jenkinsHome/:/var/jenkins_home jenkins
