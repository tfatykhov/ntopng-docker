#!/bin/bash

docker-compose stop && docker-compose rm -f && docker build --pull --no-cache --rm -t tfatykhov/ntopng-docker:rpi . && docker-compose  up -d && echo "Build prcess completed.. runninng logs" && docker-compose logs -f
