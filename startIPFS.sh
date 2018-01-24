#! /usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for (( i = 0; i < 10; i++ )); do
    IPFS_PATH="$DIR/ipfs$i" nohup ipfs daemon &> ipfs$i.log &
done
