#!/bin/sh
set -e

# go back to where we were invoked
cd $WORKDIR

save_and_shutdown() {
  # force clean shutdown
  halt -f
}

# make sure we shut down cleanly
trap save_and_shutdown EXIT INT TERM

# configure path to include /usr/local
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# can't do much without proc!
mount -t proc none /proc

# pseudo-terminal devices
mkdir -p /dev/pts
mount -t devpts none /dev/pts

# shared memory a good idea
mkdir -p /dev/shm
mount -t tmpfs none /dev/shm

# sysfs a good idea
mount -t sysfs none /sys

# pidfiles and such like
mkdir -p /var/run
mount -t tmpfs none /var/run

# takes the pain out of cgroups
cgroups-mount

# some storage for docker
mkdir -p /var/lib/docker
mount none /var/lib/docker -t hostfs -o $DOCKER_STORAGE


# configure networking
ip addr add 127.0.0.1 dev lo
ip link set lo up
ip addr add 10.0.2.15/24 dev eth0
ip link set eth0 up
ip route add default via 10.0.2.2

# start docker daemon
echo "Starting docker daemon..."
exec docker -d -H tcp://0.0.0.0:2375 &
sleep 10
export DOCKER_HOST="tcp://127.0.0.1:2375"
echo "$ docker version"
docker version
# exec docker -d -H tcp://0.0.0.0:2375 > "$STDOUT" 2> "$STDERR"
# echo "Docker daemon exited."
