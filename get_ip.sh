#!/bin/sh
set -euf -o pipefail

ip addr | grep 'scope global' | head -n1 | awk '{print $2}' | cut -f1  -d'/'
