#!/bin/sh

WORKDIR="$(pwd)""
DOCKER_STORAGE="$WORKDIR"/docker_storage

./linux quiet rootfstype=hostfs rw \
    eth0=slirp,,"$WORKDIR"/slirp.sh \
    init="$WORKDIR"/init.sh \
    WORKDIR="$WORKDIR" \
    DOCKER_STORAGE="$DOCKER_STORAGE"
