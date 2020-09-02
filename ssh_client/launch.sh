#!/bin/bash
set -e

echo "$SSH_KEY" > /ssh_key.rsa
chmod 600 /ssh_key.rsa

ssh -i /ssh_key.rsa \
    -l tunnel \
    $TUNNEL_SERVER \
    -p $TUNNEL_PORT \
    -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    -R $EXPOSE_PORT:$SERVICE_HOST:$SERVICE_PORT \
    -N
