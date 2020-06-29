###image self install documation:

first download jre-8u202-linux-x64.tar.gz

next run the following script 
```bash
tar xzf jre-8u202-linux-x64.tar.gz
cd jre-8u202-linux-x64

rm -rf COPYRIGHT LICENSE README release THIRDPARTYLICENSEREADME-JAVAFX.txt THIRDPARTYLICENSEREADME.txt Welcome.html
rm -rf lib/plugin.jar \
    lib/ext/jfxrt.jar \
    bin/javaws \
    lib/javaws.jar \
    lib/desktop \
    plugin \
    lib/deploy* \
    lib/*javafx* \
    lib/*jfx* \
    lib/amd64/libdecora_sse.so \
    lib/amd64/libprism_*.so \
    lib/amd64/libfxplugins.so \
    lib/amd64/libglass.so \
    lib/amd64/libgstreamer-lite.so \
    lib/amd64/libjavafx*.so \
    lib/amd64/libjfx*.so

tar czf jre8.tar.gz *
```

then write the Dockerfile

```
FROM frolvlad/alpine-glibc
ADD jre8.tar.gz /usr/java/jdk/
ENV JAVA_HOME /usr/java/jdk
ENV PATH ${PATH}:${JAVA_HOME}/bin
WORKDIR /opt
```

next we build the image
```bash
docker build -t <OWNER>:jre8 .
```

at last we`ve built it, check it

```bash
docker run --name javaapp -itd evoup/jre8 sh
docker exec -it javaapp sh
/opt # java -version
>java version "1.8.0_202"
>Java(TM) SE Runtime Environment (build 1.8.0_202-b08)
>Java HotSpot(TM) 64-Bit Server VM (build 25.202-b08, mixed mode)
```
all done.
