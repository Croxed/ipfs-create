#! /usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

((web=8080))
((web2=9081))
((gui=5001))
((swarm=4001))
((swarm2=3002))
for (( i = 0; i < $1; i++ )); do
    rm -rf "$DIR/ipfs$i data"
    rm -rf "$DIE/ipfs$i staging"
    mkdir -p "$DIR/ipfs$i data"
    mkdir -p "$DIR/ipfs$i staging"
    ipfs_staging="$DIR/ipfs$i staging"
    ipfs_data="$DIR/ipfs$i data"
    docker run -d --name "ipfs_host$i" -v "$ipfs_staging":/export -v "$ipfs_data":/data/ipfs -p "$web":8080 -p "$web2":8081 -p "$gui":5001 -p "$swarm":4001 -p "$swarm2":4002/udp --net bridge ipfs/go-ipfs:latest
    ((web++))
    ((web2++))
    ((gui++))
    ((swarm++))
    ((swarm2++))
done
