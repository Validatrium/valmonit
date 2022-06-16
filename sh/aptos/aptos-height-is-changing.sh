#!/bin/bash

TMP_FILE='/root/valmonit/last-height.txt'

if [ ! -f "$TMP_FILE" ]
then
    echo 0 > $TMP_FILE
fi

LAST_KNOWN_HEIGHT=$(cat $TMP_FILE)

LAST_HEIGHT=$(curl -s $METRICS 2> /dev/null | grep "aptos_state_sync_version{.*\"synced\"}" | awk '{print $2}')

if [ $LAST_HEIGHT -eq $LAST_KNOWN_HEIGHT ]; then
    echo "Height is not changing"
    echo $LAST_HEIGHT > $TMP_FILE
    exit 1
else 
    echo "Node height: $LAST_HEIGHT"
    echo $LAST_HEIGHT > $TMP_FILE
    exit 0
fi

