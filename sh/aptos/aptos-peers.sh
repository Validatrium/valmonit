#!/bin/bash

peerCount=$(curl 127.0.0.1:9101/metrics 2> /dev/null | grep "aptos_connections{direction=\"outbound\"" | awk '{print $2}')

if [ $peerCount -eq 0 ]
then
    echo "No peers connected to node: $peerCount"
    exit 1
else 
    echo "Node peers: $peerCount"
    exit 0
fi
