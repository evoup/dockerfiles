FROM debian:jessie
MAINTAINER yinjia <evoex123@gmail.com>
EXPOSE 5037 5554 5555
RUN apt-get update && \
    apt-get install -y curl default-jre-headless lib32stdc++6 unzip && \
    apt-get clean
ENV ANDROID_HOME="/opt/android-sdk-linux"
ENV ANDROID_SDK_HOME="${ANDROID_HOME}"
ENV PATH="${PATH}:${ANDROID_SDK_HOME}/tools:${ANDROID_SDK_HOME}/platform-tools"
RUN cd /tmp && \
    curl -O https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && \
    cd /opt && tar xzf /tmp/*.tgz && rm /tmp/*.tgz
RUN echo "y" | android update sdk --no-ui --force -a --filter android-23,sys-img-x86-android-23
RUN echo "n" | android create avd --force -n nexus -t android-23 -b default/x86 -c 512M
COPY avd/config.ini $ANDROID_HOME/.android/avd/nexus.avd/
RUN cd /tmp && curl -O https://dl.google.com/android/repository/platform-tools-latest-linux.zip
RUN cd /tmp && unzip platform-tools-latest-linux.zip && mv platform-tools /opt/android-sdk_linux/
RUN rm -f /tmp/*.zip
ENTRYPOINT ["emulator64-x86","@nexus"]
