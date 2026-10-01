#!/bin/bash

if [ "$#" -ne 2 ]
then
  echo "usage: <container name> <process>"
  exit 1
fi

CONTAINER="$1"
PROCESS="$2"

# total of 5 configurations. 
# Each number associates with a different configuration type
CONFIG=$(( RANDOM % 5 + 1 ))

echo "Recycling $CONTAINER"
echo "Selected configuration: $CONFIG"

sudo screen -S "$PROCESS" -X quit 2>/dev/null || true

sudo lxc delete "$CONTAINER" --force

# create_honeypot.sh will handle creating the honeypot 
# with the specific config associated with the random number
./create_honeypot.sh "$CONTAINER" "$CONFIG"
