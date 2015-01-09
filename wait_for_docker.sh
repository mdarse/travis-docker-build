#!/bin/sh

# when no arguments was given
if [ $# -eq 0 ]
then
    echo "Usage: $0 <host> [port]"
    exit 1
fi

HOST=$1
# port defaults to 2375
PORT=${2:-2375}
RETRIES=10

echo -n "Waiting for docker to start on ${HOST}:${PORT}"
# loop until we connect successfully or failed 10 times
until curl "http://${HOST}:${PORT}/info" &>/dev/null
do
    let RETRIES-=1
    if [ $RETRIES -eq 0 ]
    then
        echo "Failed to connect"
        exit 1
    fi
    # wait a bit
    echo -n "."
    sleep 1
done
echo
