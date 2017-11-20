FROM resin/rpi-raspbian:latest
MAINTAINER Timur Fatykhov <tfatykhov@gmail.com>

RUN apt-get update
RUN apt-get -y install wget
RUN wget http://packages.ntop.org/apt/ntop.key
RUN apt-key add ntop.key
RUN echo "deb http://apt.ntop.org/stretch_pi armhf/" > /etc/apt/sources.list.d/ntop.list
RUN echo "deb http://apt.ntop.org/stretch_pi all/" >> /etc/apt/sources.list.d/ntop.list
RUN  \
  apt-get update \
  && apt-get install  nprobe ntopng ntopng-data \
  && apt-get clean \
  && rm -rf /tmp/* \
  && rm -rf /var/tmp/* \
  && rm -rf /var/lib/apt/lists/*
