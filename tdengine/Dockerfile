# Compile image
FROM ubuntu:16.04 as compile

WORKDIR /root

COPY src/ ./src/ 
COPY deps/ ./deps/
COPY packaging/ ./packaging/
COPY CMakeLists.txt ./
COPY tests/ ./tests/
COPY cmake/ ./cmake/

RUN apt update -y

RUN apt install -y build-essential

Run apt install -y cmake

WORKDIR /root/build
RUN cmake .. && cmake --build .

CMD ["bash"]

# Final image
FROM ubuntu:16.04

WORKDIR /root

RUN mkdir /usr/lib64/
COPY --from=compile /root/build/build/bin /usr/bin/
COPY --from=compile /root/build/build/lib/libtaos.so /usr/lib/
RUN ln -s /usr/lib/libtaos.so /usr/lib/libtaos.so.1
RUN ls /usr/lib/ | grep libtaos
RUN echo "-----------------------"
RUN ls /usr/
RUN ln -s /usr/lib/libtaos.so /usr/lib64/libtaos.so.1
COPY packaging/cfg/taos.cfg /etc/taos/

RUN echo "charset UTF-8" >> /etc/taos/taos.cfg

ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib"
ENV LC_CTYPE="en_US.UTF-8"

CMD ["taosd"]
