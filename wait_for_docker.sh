#!/bin/sh

echo -n "Waiting for docker to start"
until curl http://"$HOST_IP":2375/info
# while netstat -lnt | awk '$4 ~ /:2375$/ {exit 1}'
do
    echo -n "."
    sleep 1
done
echo
