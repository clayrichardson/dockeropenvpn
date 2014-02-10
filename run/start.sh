#!/bin/sh
set -ex

[ -d /dev/net ] ||
    mkdir -p /dev/net
[ -c /dev/net/tun ] ||
    mknod /dev/net/tun c 10 200

iptables -t nat -A POSTROUTING -s 10.169.0.0/24 -o eth0 -j MASQUERADE

/usr/bin/supervisord

# adapted from: http://stackoverflow.com/a/20932423/1050649
while ( true )
  do
  echo "Detach with Ctrl-p Ctrl-q. Dropping to shell"
  sleep 1
  /bin/bash
done

