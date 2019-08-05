#!/bin/sh

docker run -d -p 8080:8080 -p 50000:50000 --restart always --name jenkins --net b0 --hostname jenkins -v /volume1/jenkinsHome/:/var/jenkins_home evoup/jenkins

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

#or use another waiy upgrade
#All the data needed is in the /var/jenkins_home directory - so depending on how you manage that - depends on how you upgrade. Generally - you can copy it out - and then "docker pull" the image again - and you will have the latest LTS - you can then start up with -v pointing to that data (/var/jenkins_home) and everything will be as you left it.


#install maven
#apt-get install maven
