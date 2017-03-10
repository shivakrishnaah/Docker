#!/bin/bash
# From evironment file it will export 
# HADOOP_OPTS = -Dfs.defaultFS=hdfs://namenode:9000 -Ddfs.namenode.name.dir=file:/usr/local/hadoop-2.7.3/hdfs/namenode 
# HADOOP_CONFIG =  /usr/local/hadoop-2.7.3/etc/hadoop
#Format the node
/usr/sbin/sshd -D &
echo "*********------- ${HADOOP_OPTS} ******-----------"
hdfs namenode ${HADOOP_OPTS} -format
# Start the yarn server
yarn-daemon.sh --config ${HADOOP_CONFIG} start resourcemanager
start-yarn.sh
hdfs namenode ${HADOOP_OPTS}
