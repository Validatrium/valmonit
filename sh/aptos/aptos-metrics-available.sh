#!/bin/bash

result=$(curl -s $METRICS)

if [ -z "$result" ]
then
    echo "metrics are not available"
    exit 1
else
    echo "metrics are ok"
fi
