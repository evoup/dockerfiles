docker run -it -p 9000:9000 \
    -e KAFKA_BROKERCONNECT=<host:port,host:port> \
    obsidiandynamics/kafdrop
