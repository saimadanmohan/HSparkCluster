#!/bin/bash
javapath="export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64"
#HADOOP_CLASSPATH=~/Hadoop/etc/tez:hadoop/tez_jars/*:hadoop/tez_jars/lib/*
hadoop_envfile=~/hadoop/etc/hadoop/hadoop-env.sh
echo JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/ >> ~/.bashrc
echo export HADOOP_PREFIX=~/hadoop >> ~/.bashrc;
echo export HADOOP_YARN_HOME=~/hadoop >> ~/.bashrc;
echo export HADOOP_HOME=~/hadoop >> ~/.bashrc;
echo export HADOOP_CONF_DIR=~/hadoop/etc/hadoop >> ~/.bashrc;
echo export YARN_CONF_DIR=~/hadoop/etc/hadoop >> ~/.bashrc;
source ~/.bashrc
echo -e "$javapath\n$(cat $hadoop_envfile)" > $hadoop_envfile
#echo -e "$HADOOP_CLASSPATH\n$(cat $hadoop_envfile)" > $hadoop_envfile
mkdir -p /data/hdfs/namenode
mkdir -p /data/hdfs/datanode
mkdir -p /data/logs/hadoop
chmod -R 777 /data
