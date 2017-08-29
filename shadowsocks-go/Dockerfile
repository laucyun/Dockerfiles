FROM busybox

MAINTAINER LauCyun <liu@liuker.xyz>

ENV SS_VERSION 1.2.1

RUN mkdir -p /opt/shadowsocks

ADD https://github.com/shadowsocks/shadowsocks-go/releases/download/$SS_VERSION/shadowsocks-server.tar.gz /opt/shadowsocks/shadowsocks-server.tar.gz

RUN tar -xzvf /opt/shadowsocks/shadowsocks-server.tar.gz -O > /opt/shadowsocks/ss-server
RUN chmod u+x /opt/shadowsocks/ss-server

ADD ss.json /opt/shadowsocks/ss.json

ENTRYPOINT ["/opt/shadowsocks/ss-server"]
