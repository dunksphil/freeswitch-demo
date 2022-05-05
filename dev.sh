#!/usr/bin/env bash
set -o errexit -o pipefail -o nounset

NETWORK_ADDRESS="192.168.1.247"

SERVICE_NAME="freeswitch-demo"

docker build --tag dunksp/"$SERVICE_NAME":latest .

docker rm -fv "$SERVICE_NAME" || true

docker run \
    --detach=true \
    --cpus=1 \
    --memory=1024m \
    --publish 8081:8081/tcp \
    --publish 5061:5061/udp \
    --publish 5061:5061/tcp \
    --publish 64134:64134/udp \
    --publish 64135:64135/udp \
    --publish 64136:64136/udp \
    --publish 64137:64137/udp \
    --publish 64138:64138/udp \
    --publish 64139:64139/udp \
    --publish 64140:64140/udp \
    --publish 64141:64141/udp \
    --publish 64142:64142/udp \
    --publish 64143:64143/udp \
    --publish 64144:64144/udp \
    --publish 64145:64145/udp \
    --publish 64146:64146/udp \
    --publish 64147:64147/udp \
    --publish 64148:64148/udp \
    --publish 64149:64149/udp \
    --publish 64150:64150/udp \
    --publish 64151:64151/udp \
    --publish 64152:64152/udp \
    --publish 64153:64153/udp \
    --publish 64154:64154/udp \
    --publish 64155:64155/udp \
    --publish 64156:64156/udp \
    --publish 64157:64157/udp \
    --publish 64158:64158/udp \
    --publish 64159:64159/udp \
    --publish 64160:64160/udp \
    --env NETWORK_ADDRESS="$NETWORK_ADDRESS" \
    --name="$SERVICE_NAME" \
    dunksp/"$SERVICE_NAME"
