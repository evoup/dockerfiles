#!/bin/sh
#docker run -ti --cap-add=NET_ADMIN --device /dev/net/tun --name vpn0 \
            #-e USER=user@email.com -e PASS=password \
            #-e COUNRTY="country1;country2" -e CATEGORY="Obfuscated Servers" \
            #-e PROTOCOL=protocol -d bubuntux/nordvpn

docker run -ti --cap-add=NET_ADMIN --device /dev/net/tun --name vpn0 \
            -e USER=user@email.com -e PASS=password \
            -e CATEGORY="Obfuscated Servers" \
            -d evoup/nordvpn
