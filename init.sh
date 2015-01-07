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

mkdir $WORKDIR/host
mount none $WORKDIR/host -o $WORKDIR/humfs-mount -t humfs

docker -d -H unix://$WORKDIR/host/docker.sock &
