#!/bin/bash
cd ~ && hadoop/bin/hdfs namenode -format hdfs
cd ~ && hadoop/sbin/start-dfs.sh
cd ~ && hadoop/sbin/start-yarn.sh
