FROM alpine

RUN apk update \
    && apk add gcc libc-dev make openssl \
    && wget https://github.com/jech/polipo/archive/polipo-1.1.1.tar.gz \
    && tar xf polipo-1.1.1.tar.gz \
    && cd polipo-polipo-1.1.1 \
    && make \
    && mv polipo /usr/local/bin \
    && apk del gcc libc-dev make openssl \
    && cd .. \
    && rm -rf polipo-* /var/cache/apk/*

ENV PROXY_ADDRESS="0.0.0.0"
ENV SOCKS_PARENT_PROXY="192.168.1.13:10800"
ENV SOCKS_PROXY_TYPE="socks5" 
ENV PROXY_PORT="8124"
ENV DNS_NAME_SERVER="8.8.8.8"
EXPOSE 8124

ADD files/start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
CMD []
