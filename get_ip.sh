#!/bin/sh
set -euf

ip addr | grep 'scope global' | head -n1 | awk '{print $2}' | cut -f1  -d'/'
