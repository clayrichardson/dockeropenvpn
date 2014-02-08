#!/bin/sh
set -ex

[ -d /dev/net ] ||
    mkdir -p /dev/net
[ -c /dev/net/tun ] ||
    mknod /dev/net/tun c 10 200

iptables -t nat -A POSTROUTING -s 10.169.0.0/24 -o eth0 -j MASQUERADE

/usr/bin/supervisord
tail -F /var/log/supervisor/*.log /var/log/openvpn/*.log

