#!/bin/bash

result=$(curl -s $RPC_ADDR/status)

if [ -z "$result" ]
then

    echo "rpc doesn't work"
    exit 1

else

    echo 'rpc ok'
    exit 0

fi
