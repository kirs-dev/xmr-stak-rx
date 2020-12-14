#!/bin/bash

TAG=${1:-latest}
ADDRESS=${ADDRESS:-42AgPLgx3mA8FsqvwEqq8TGb2xQACGi7W3MguqVXgEGNLvjZ5Z4CDjw8xov7k8aHFBVRbHrZkLiixXbAxtwgQCamS3n47L4}
HOST=${HOST:-$(hostname -s)}
PORT=${PORT:-8000}
POOL_HOST=${POOL:-ca.minexmr.com:5555}
POOL_USER=${POOL_USER:-$ADDRESS.$HOST-$TAG}
POOL_PASS=${POOL_PASS:-ServerCPU:mail@kirsanth.com}
USE_TLS=${USE_TLS:-true}
CURRENCY=${CURRENCY:-monero}

docker pull patsissons/xmr-stak:$TAG && \
docker rm -f xmr-stak-$TAG 2> /dev/null && \
docker run --runtime=nvidia --device /dev/dri --device -it --name xmr-stak-rx-$TAG -v xmr-stak-rx-config:/config -p $PORT:8000 kirs-dev/xmr-stak-rx:$TAG -o $POOL_HOST -u $POOL_USER -p $POOL_PASS --currency $CURRENCY --httpd 8000
