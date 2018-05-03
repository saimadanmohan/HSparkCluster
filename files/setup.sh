#!/bin/bash
javapath="export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64"
hadoop_envfile=~/hadoop/etc/hadoop/hadoop-env.sh
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/ >> ~/.bashrc
echo export HADOOP_PREFIX=~/hadoop >> ~/.bashrc;
echo export HADOOP_YARN_HOME=~/hadoop >> ~/.bashrc;
echo export HADOOP_HOME=~/hadoop >> ~/.bashrc;
echo export HADOOP_CONF_DIR=~/hadoop/etc/hadoop >> ~/.bashrc;
echo export YARN_CONF_DIR=~/hadoop/etc/hadoop >> ~/.bashrc;
source ~/.bashrc
echo -e "$javapath\n$(cat $hadoop_envfile)" > $hadoop_envfile
mkdir /dev/hdfs
chmod 777 /dev/hdfs
