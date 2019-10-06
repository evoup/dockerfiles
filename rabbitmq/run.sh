#!/bin/sh
docker run --restart always -d -p5672:5672 -p15672:15672 --hostname rabbitmq --name rabbitmq rabbitmq:3-management
