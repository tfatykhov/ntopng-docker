FROM resin/rpi-raspbian:stretch
MAINTAINER Timur Fatykhov <tfatykhov@gmail.com>

RUN apt-get update
RUN apt-get -y install wget
RUN wget http://packages.ntop.org/apt/ntop.key
RUN apt-key add ntop.key
RUN echo "deb http://apt.ntop.org/stretch_pi armhf/" > /etc/apt/sources.list.d/ntop.list
RUN echo "deb http://apt.ntop.org/stretch_pi all/" >> /etc/apt/sources.list.d/ntop.list
RUN  \
  apt-get update \
  && apt-get dist-upgrade \
  && apt-get upgrade
  RUN apt-get install --no-install-recommends --no-install-suggests  --allow-change-held-packages --allow-remove-essential --allow-downgrades nprobe ntopng ntopng-data
  RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
