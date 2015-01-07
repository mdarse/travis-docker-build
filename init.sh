#!/bin/sh
set -e

save_and_shutdown() {
  # save built for host result
  # force clean shutdown
  halt -f
}
# make sure we shut down cleanly
trap save_and_shutdown EXIT INT TERM


cd $WORKDIR
pwd


# configure networking
ip addr add 127.0.0.1 dev lo
ip link set lo up
ip addr add 10.1.1.1/24 dev eth0
ip link set eth0 up
ip route add default via 10.1.1.254

docker -d
