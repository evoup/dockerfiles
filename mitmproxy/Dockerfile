FROM python:3.7-alpine

# Note: We add a dummy xclip because we don't want to support clipboard
# from within the container.
RUN apk update
RUN apk add --no-cache \
        bash \
        g++ \
        libffi \
        libffi-dev \
        libjpeg-turbo \
        libjpeg-turbo-dev \
        libxml2 \
        libxml2-dev \
        libxslt \
        libxslt-dev \
        openssl \
        openssl-dev \
        python3-dev \
        zlib \
        zlib-dev \
        #certifi \
        ca-certificates \
    && LDFLAGS=-L/lib pip install mitmproxy \
    && apk del --purge \
        g++ \
        libffi-dev \
        libjpeg-turbo-dev \
        libxml2-dev \
        libxslt-dev \
        openssl-dev \
        python3-dev \
        zlib-dev \
        #certifi \
        ca-certificates \
    && rm -rf ~/.cache/pip \
    && adduser -u 7799 -D mitmproxy

ENV LANG=en_US.UTF-8

USER mitmproxy
RUN mkdir /home/mitmproxy/.mitmproxy
VOLUME /home/mitmproxy/.mitmproxy

EXPOSE 8080

CMD ["bash"]
