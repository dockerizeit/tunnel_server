#!/bin/bash
set -e

mkdir -p /home/tunnel/.ssh
echo "$SSH_KEY" > tunnel_key.pem
ssh-keygen -i -m PKCS8 -f tunnel_key.pem > /home/tunnel/.ssh/authorized_keys

/usr/sbin/sshd -D
