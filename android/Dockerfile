#Run android in a container
# docker run --name android --privileged=true -ti -d --hostname android evoup/android

FROM ubuntu:16.04
LABEL maintainer "evoup <evoex123@gmail.com>"
RUN apt-get update
RUN apt-get -y install openjdk-8-jdk
RUN apt-get -y install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip python
RUN mkdir /root/bin
RUN PATH=/root/bin:$PATH && curl https://storage.googleapis.com/git-repo-downloads/repo > /root/bin/repo && chmod a+x /root/bin/repo
RUN mkdir /WORKING_DIRECTORY && cd /WORKING_DIRECTORY
RUN git config --global user.name "evoup"
RUN git config --global user.email "evoex123@gmail.com"
#RUN /root/bin/repo init -u https://android.googlesource.com/platform/manifest
RUN cd /WORKING_DIRECTORY && /root/bin/repo init -u https://android.googlesource.com/platform/manifest -b android-8.0.0_r35
#RUN /root/bin/repo sync


