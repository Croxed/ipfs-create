#! /usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

((web=8080))
((web2=9081))
((gui=5001))
((swarm=4001))
((swarm2=3002))
rm -rf "$DIR/ipfs*"
for (( i = 0; i < 10; i++ )); do
    mkdir -p "$DIR/ipfs$i"
    IPFS_PATH="$DIR/ipfs$i" ipfs init
    sed -i -e "s/8080\+/$web/g; s/8081\+/$web2/g; s/5001\+/$gui/g; s/4001\+/$swarm/g; s/4002\+/$swarm2/g" "$DIR/ipfs$i/config"
    ((web++))
    ((web2++))
    ((gui++))
    ((swarm++))
    ((swarm2++))
done
