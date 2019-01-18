FROM ubuntu:latest
MAINTAINER Kristian Gray <kristian.gray@gmail.com>

ADD ./build.sh /build.sh
ADD ./cpanfile /cpanfile
RUN /build.sh
CMD ['mkdir /root/app']
WORKDIR /root/app