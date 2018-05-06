#!/bin/bash
mkdir -p ~/.ssh
cp /tmp/id_rsa ~/.ssh/id_rsa
cp /tmp/id_rsa.pub ~/.ssh/id_rsa.pub
chmod 400 ~/.ssh/id_rsa.pub
chmod 400 ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys;
echo 'StrictHostKeyChecking no' > ~/.ssh/config
service ssh start
/tmp/master-node.sh
/tmp/tez-script.sh
/tmp/spark-setup.sh
/tmp/hibench-setup.sh
tail -f /dev/null
