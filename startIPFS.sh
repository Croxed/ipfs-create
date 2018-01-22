#! /usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker ps -a -q | xargs -n 1 docker start

#for (( i = 0; i < 10; i++ )); do
#    docker start "ipfs$i"
#done
