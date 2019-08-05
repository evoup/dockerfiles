#!/bin/sh

docker run -p 8080:8080 -p 50000:50000 --restart always --name jenkins --net b0 --hostname jenkins -v /volume1/jenkinsHome/:/var/jenkins_home jenkins

#note must update jenkins to lastest version, otherwise can not run
#https://medium.com/@jimkang/how-to-start-a-new-jenkins-container-and-update-jenkins-with-docker-cf628aa495e9
#using host's root with -u 0
#docker container exec -u 0 -it jenkins bash
# inside the container, using 2.89.2 as example
#wget http://archives.jenkins-ci.org/war-stable/2.176.2/jenkins.war
#mv ./jenkins.war /usr/share/jenkins
#chown jenkins:jenkins /usr/share/jenkins/jenkins.war
#exit
#docker restart jenkins


#install maven
#apt-get install maven
