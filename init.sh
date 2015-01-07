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

mkdir -p /host
mount none /host -o $WORKDIR/humfs-mount -t humfs
ls -l /host
