#!/bin/sh

WORKDIR="$(pwd)"
DOCKER_STORAGE="$WORKDIR"/docker_storage

# STDOUT="$WORKDIR"/docker_daemon_stdout.log
# STDERR="$WORKDIR"/docker_daemon_stderr.log

# touch "$STDOUT"
# touch "$STDERR"

./linux quiet rootfstype=hostfs rw \
    eth0=slirp,,"$WORKDIR"/slirp.sh \
    init="$WORKDIR"/init.sh \
    WORKDIR="$WORKDIR" \
    DOCKER_STORAGE="$DOCKER_STORAGE"
    # STDOUT="$STDOUT"
    # STDERR="$STDERR"
    # > uml_stdout.log
    # 2> uml_stderr.log
