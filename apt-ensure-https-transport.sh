#!/bin/sh

[ -e /usr/lib/apt/methods/https ] || {
  apt-get update
  apt-get install -qq apt-transport-https
}
