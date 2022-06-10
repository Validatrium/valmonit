#!/bin/bash
export API_ADDR=localhost:1317
export RPC_ADDR=localhost:26657

# echo $1 $2

/bin/bash -c "./$1 $2"
