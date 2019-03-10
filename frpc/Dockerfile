FROM alpine:latest
MAINTAINER evoex123@gmail.com

#forked from https://github.com/clangcn/frp-docker/blob/master/frps-docker/Dockerfile
#change form frp server, because this is client!
#docker build -t evoup/frpc .
#docker run -itd --name frpc -v /path/to/your_conf:/conf evoup/frpc bash

ENV frpc_version=0.22.0 \
    frpc_DIR=/usr/local/frpc

RUN set -ex && \
    frpc_latest=https://github.com/fatedier/frp/releases/download/v${frpc_version}/frp_${frpc_version}_linux_amd64.tar.gz && \
    frpc_latest_filename=frp_${frpc_version}_linux_amd64.tar.gz && \
    apk add --no-cache pcre bash && \
    apk add --no-cache  --virtual TMP wget tar && \
    [ ! -d ${frpc_DIR} ] && mkdir -p ${frpc_DIR} && cd ${frpc_DIR} && \
    wget --no-check-certificate -q ${frpc_latest} -O ${frpc_latest_filename} && \
    tar xzf ${frpc_latest_filename} && \
    mv frp_${frpc_version}_linux_amd64/frpc ${frpc_DIR}/frpc && \
    apk --no-cache del --virtual TMP && \
    rm -rf /var/cache/apk/* ~/.cache ${frpc_DIR}/${frpc_latest_filename} ${frpc_DIR}/frp_${frpc_version}_linux_amd64

VOLUME /conf

ENTRYPOINT ["/usr/local/frpc/frpc", "-c", "/conf/frpc.ini"]

