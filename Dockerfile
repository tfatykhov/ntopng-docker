FROM resin/rpi-raspbian:latest
MAINTAINER Timur Fatykhov <tfatykhov@gmail.com>
USER root
RUN apt-get update
RUN apt-get -y install wget
RUN wget http://packages.ntop.org/apt-stable/ntop.key
RUN apt-key add ntop.key
RUN echo "deb http://apt-stable.ntop.org/jessie_pi armhf/" > /etc/apt/sources.list.d/ntop.list
RUN echo "deb http://apt-stable.ntop.org/jessie_pi all/" >> /etc/apt/sources.list.d/ntop.list
RUN  \
  apt-get update
  RUN apt-get install nprobe ntopng ntopng-data libpcap0.8 libmysqlclient18 \
  && apt-get dist-upgrade \
  && apt-get upgrade
  RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
