# Run nordvpn in a container
#
#docker build -t madhouse/nordvpn --build-arg proxy=172.17.0.1:8124 . 
#docker run -ti --cap-add=NET_ADMIN --device /dev/net/tun --name vpn\
            #-e USER=user@email.com -e PASS=password
            #-e COUNRTY="country1;country2" -e CATEGORY=category1;category2 \
            #-e PROTOCOL=protocol -d bubuntux/nordvpn

FROM alpine:3.7

LABEL maintainer="Julio Gutierrez <bubuntux@gmail.com>"

COPY nordVpn.sh /usr/bin

HEALTHCHECK --start-period=15s --timeout=15s --interval=60s \
            CMD curl -fL 'https://api.ipify.org' || exit 1

# proxy for GFW running container
ARG proxy 

ENV URL_NORDVPN_API="https://api.nordvpn.com/server" \
    URL_RECOMMENDED_SERVERS="https://nordvpn.com/wp-admin/admin-ajax.php?action=servers_recommendations" \
    URL_OVPN_FILES="https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip" \
    MAX_LOAD=70 \
    PROXY=$proxy

VOLUME ["/vpn/ovpn/"]

    # Install dependencies 
RUN apk --no-cache --no-progress update && \
    apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add bash curl unzip iptables ip6tables jq openvpn tini && \
    mkdir -p /vpn/ovpn/

ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/nordVpn.sh"]
