# Compile image
FROM centos as compile

WORKDIR /root

COPY src/ ./src/ 
COPY deps/ ./deps/
COPY packaging/ ./packaging/
COPY CMakeLists.txt ./

RUN yum update -y

RUN yum group install -y "Development Tools"

Run yum install -y cmake

WORKDIR /root/build
RUN cmake .. && cmake --build .

CMD ["bash"]

# Final image
FROM centos

WORKDIR /root

COPY --from=compile /root/build/build/bin /usr/bin/
COPY --from=compile /root/build/build/lib/libtaos.so /usr/lib/
COPY packaging/cfg/taos.cfg /etc/taos/

RUN echo "charset UTF-8" >> /etc/taos/taos.cfg

ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib"
ENV LC_CTYPE="en_US.UTF-8"

CMD ["taosd"]
