#!/bin/sh
set -euf

# when no arguments was given
if [ $# -eq 0 ]; then
    echo "Usage: $0 <host>"
    exit 1
fi

HOST_IP=$1
WORKDIR="$(pwd)"

# will be mounted inside UML as /var/lib/docker
DOCKER_STORAGE="${WORKDIR}/docker_storage"
mkdir -p $DOCKER_STORAGE

$WORKDIR/linux quiet rootfstype=hostfs rw \
    # since we can't pass directly argument to slirp binary, we use a wrapper script
    eth0=slirp,,"${WORKDIR}/slirp.sh" \
    init="${WORKDIR}/init.sh" \
    WORKDIR="$WORKDIR" \
    HOME="$HOME" \
    DOCKER_STORAGE="$DOCKER_STORAGE" \
