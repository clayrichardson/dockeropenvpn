#!/bin/sh
set -e

[ -d /dev/net ] ||
    mkdir -p /dev/net
[ -c /dev/net/tun ] ||
    mknod /dev/net/tun c 10 200

mkdir -p /var/log/openvpn

cd /etc/openvpn

touch /var/log/openvpn/openvpn.log
touch /var/log/openvpn/status.log

iptables -t nat -A POSTROUTING -s VPC_SUBNET/24 -o eth0 -j MASQUERADE

while true ; do openvpn --config /etc/openvpn/server.config ; done >> /var/log/openvpn/openvpn.log &
tail -F /var/log/openvpn/*.log
