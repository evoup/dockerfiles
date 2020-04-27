docker run -itd --restart always --name kafdrop -p 9000:9000 \
    -e KAFKA_BROKERCONNECT=172.16.30.220:9092 \
    obsidiandynamics/kafdrop
