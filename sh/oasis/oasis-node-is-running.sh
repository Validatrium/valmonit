#!/bin/bash

result=$(oasis-node control status -a unix:/node/data/internal.sock)

if [ -z "$result" ]
then

    echo "node is not running"
    exit 1

else

    echo "node is running"
    exit 0

fi
