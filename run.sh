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

# STDOUT="$WORKDIR"/docker_daemon_stdout.log
# STDERR="$WORKDIR"/docker_daemon_stderr.log

# touch "$STDOUT"
# touch "$STDERR"

# docker server should be reachable only on $HOST_IP due to port redirect
export DOCKER_HOST="tcp://${HOST_IP}:2375"

$WORKDIR/linux quiet rootfstype=hostfs rw \
    eth0=slirp,,"${WORKDIR}/slirp.sh" \
    init="${WORKDIR}/init.sh" \
    WORKDIR="$WORKDIR" \
    HOME="$HOME" \
    DOCKER_STORAGE="$DOCKER_STORAGE" \
    # HOST_IP="$HOST_IP"
    # STDOUT="$STDOUT"
    # STDERR="$STDERR"
    # > uml_stdout.log
    # 2> uml_stderr.log
