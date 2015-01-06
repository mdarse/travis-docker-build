#!/bin/sh
set -e

cd $WORKDIR
pwd

mount none /host -o $WORKDIR/humfs-mount -t humfs
ls -l /host
