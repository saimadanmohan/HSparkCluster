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
#/tmp/tez-script.sh
/tmp/spark-setup.sh
#/tmp/hibench-setup.sh
~/hadoop/bin/hadoop dfs -mkdir /apps
~/hadoop/bin/hadoop dfs -mkdir /apps/tez
~/hadoop/bin/hadoop dfs -copyFromLocal ~/apache-tez-0.9.0-src/tez-dist/target/tez-0.9.0.tar.gz /apps/tez/

tail -f /dev/null
