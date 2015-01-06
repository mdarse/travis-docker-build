#!/bin/sh
set -e

cd $WORKDIR
pwd

mkdir -p /host
mount none /host -o $WORKDIR/humfs-mount -t humfs
ls -l /host
