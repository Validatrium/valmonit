#!/bin/bash
# $RPC_ADDR is passed through cosmos-rpc.sh
# you can run even without it, just uncomment:
# RPC_ADDR=localhost:26657

TMP_FILE='/root/valmonit/last-height.txt'

if [ !  -f "$TMP_FILE" ]; then
    echo 0 >  $TMP_FILE
fi

LAST_KNOWN_HEIGHT=$(cat $TMP_FILE)

LAST_HEIGHT=$(curl -s ${RPC_ADDR}/status | jq '(.result.sync_info.latest_block_height | tonumber)')

if [ $LAST_KNOWN_HEIGHT -eq $LAST_HEIGHT ]; then
        echo 'Height is not changing'
        echo $LAST_HEIGHT > $TMP_FILE
        exit 1
else
        echo 'Height is ok'
        echo $LAST_HEIGHT > $TMP_FILE
        exit 0
fi
