#!/bin/bash

docker run --rm -t -p 8883:8883 --name mosquitto-ssl -v `pwd`/mosquitto_config/:/mosquitto/config/ -v /dev/log:/dev/log eclipse-mosquitto &
