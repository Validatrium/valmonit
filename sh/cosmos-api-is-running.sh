#!/bin/bash

result=$(curl -s $API_ADDR/status)

if [ -z "$result" ]
then

    echo "api doesn't work"
    exit 1

else

    echo 'api ok'
    exit 0

fi
