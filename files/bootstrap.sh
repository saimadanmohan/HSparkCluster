#!/bin/bash
cp /tmp/id_rsa ~/.ssh/
cp /tmp/id_rsa.pub ~/.ssh/
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys;
echo 'StrictHostKeyChecking no' >> ~/.ssh/config
#/tmp/master-node.sh
tail -f /dev/null
