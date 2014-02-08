FROM ubuntu:latest

RUN apt-key update
RUN apt-get update

RUN apt-get install -qy curl
RUN apt-get install -qy vim
RUN apt-get install -qy supervisor
RUN apt-get install -qy git

RUN apt-get install -qy iptables
RUN apt-get install -qy openvpn

RUN mkdir -p /var/log/supervisor
RUN mkdir -p /var/log/openvpn

RUN touch /var/log/openvpn/openvpn.log
RUN touch /var/log/openvpn/status.log

ADD ./ssl /ssl
ADD ./conf/openvpn/server.conf /etc/openvpn/server.conf
ADD ./conf/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD ./run /run

EXPOSE 443/udp

CMD /bin/bash /run/start.sh
