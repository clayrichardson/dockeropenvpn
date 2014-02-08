FROM ubuntu:latest

RUN apt-key update
RUN apt-get update

RUN apt-get install -qy curl
RUN apt-get install -qy vim
RUN apt-get install -qy supervisor
RUN apt-get install -qy git

RUN apt-get install -qy openvpn

RUN mkdir -p /var/log/supervisor
RUN mkdir -p /var/log/openvpn

ADD ./openvpn /etc/openvpn

EXPOSE 443/tcp 1194/udp 

CMD /bin/bash /run/start.sh
