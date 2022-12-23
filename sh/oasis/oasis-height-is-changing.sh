#!/bin/bash
# $RPC_ADDR is passed through cosmos-rpc.sh
# you can run even without it, just uncomment:
# RPC_ADDR=localhost:26657

TMP_FILE='/root/valmonit/last-height.txt'

if [ !  -f "$TMP_FILE" ]; then
    echo 0 >  $TMP_FILE
fi

LAST_KNOWN_HEIGHT=$(cat $TMP_FILE)

status=$(oasis-node control status -a unix:/node/data/internal.sock)

LAST_HEIGHT=$( echo $status | jq '(.consensus.latest_height | tonumber)')

if [ $LAST_KNOWN_HEIGHT -eq $LAST_HEIGHT ]; then
        echo 'Height is not changing'
        echo $LAST_HEIGHT > $TMP_FILE
        exit 1
else
        echo "Node height: $LAST_HEIGHT"
        echo $LAST_HEIGHT > $TMP_FILE
        exit 0
fi
