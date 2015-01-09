#!/bin/sh
set -euf

on_exit() {
    if [ -z $IP ]
    then
        echo "Unable to detect IP address" >&2
        exit 1
    fi
}

trap on_exit EXIT

IP=$(ip addr | grep 'scope global' | head -n1 | awk '{print $2}' | cut -f1  -d'/')
echo "$IP"
