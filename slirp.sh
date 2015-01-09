#!/bin/sh

printenv

exec /usr/bin/slirp-fullbolt "redir 2375 10.0.2.15:2375" "host addr $HOST_IP"
