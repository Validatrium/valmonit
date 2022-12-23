#!/bin/bash

# $RPC_ADDR is passed through cosmos-rpc.sh
# you can run even without it, just uncomment:
# RPC_ADDR=localhost:26657

status=$(oasis-node control status -a unix:/node/data/internal.sock)

peerCount=$(echo $status | jq -r '.consensus.node_peers | length')

if [ $peerCount -gt 0 ]; then
    echo "node peers: $peerCount"
    exit 0
else
    echo "no peers"
    exit 1
fi
