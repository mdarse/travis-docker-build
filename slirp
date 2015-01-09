#!/bin/sh
set -e

# this script is run in the context of the host, no inside of UML

# when no arguments was given
if [ -z $DOCKER_HOST_IP ]; then
    echo "Error: DOCKER_HOST_IP environment variable was expected"
    exit 1
fi

exec /usr/bin/slirp-fullbolt "redir 2375 10.0.2.15:2375" "host addr $DOCKER_HOST_IP"
