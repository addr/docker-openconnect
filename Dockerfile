#
# Dockerfile for openconnect
#

FROM debian:jessie
MAINTAINER Andy Rice <andy@andydrice.com>

ENV DEBIAN_FRONTED noninteractive
ENV TERM linux

RUN set -ex \
    && apt-get update -yqq \
    && apt-get install -yqq --no-install-recommends \
       expect \
       openconnect 
COPY entrypoint.exp /entrypoint.exp
COPY root.pem /root.pem
RUN chmod +x /entrypoint.exp

ENTRYPOINT ["./entrypoint.exp"]
