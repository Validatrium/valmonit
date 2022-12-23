#!/bin/bash

result=$(oasis-node control status -a unix:/node/data/internal.sock | jq -r '.consensus.is_validator')

if [ "$result" != "true" ]
then

    echo "node is not validator"
    exit 1

else

    echo "node is validator"
    exit 0

fi
