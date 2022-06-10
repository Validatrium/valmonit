#!/bin/bash

# $RPC_ADDR is passwd through cosmos-rpc.sh
# you can run even without it, just uncomment: 
# RPC_ADDR=localhost:26657

votingPower=$(curl -s $RPC_ADDR/status | jq -r '.result.validator_info.voting_power')

if [ $votingPower -eq 0 ]; then
    echo "zero voting power"
    exit 1
else
    echo "voting power: $votingPower"
    exit 0
fi
