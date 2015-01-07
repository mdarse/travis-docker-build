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

stat $WORKDIR

mount

touch up.txt

# mount none /host -o $WORKDIR/humfs-mount -t humfs
# ls -l /host
