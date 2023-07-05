#!/bin/bash

echo "Starting sshd"
/usr/sbin/sshd
echo "Starting nginx"
/usr/sbin/nginx
echo "Ready"
sleep infinity