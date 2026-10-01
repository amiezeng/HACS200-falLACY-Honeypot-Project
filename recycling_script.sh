#!/bin/bash

if [ "$#" -ne 2 ]
then
  echo "usage: <container name> <process>"
  exit 1
fi

sudo screen -S "$2" -X quit
lxc delete $1 --force
