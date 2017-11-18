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

EXPOSE 8123
ENTRYPOINT ["polipo"]
CMD ["proxyAddress=0.0.0.0", "dnsNameServer=8.8.8.8"]
