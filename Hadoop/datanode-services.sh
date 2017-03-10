#!/bin/bash
# From evironment file it will export 
# HADOOP_OPTS = -Dfs.defaultFS=hdfs://namenode:9000 -Ddfs.namenode.name.dir=file:/usr/local/hadoop-2.7.3/hdfs/namenode 
# HADOOP_CONFIG =  /usr/local/hadoop-2.7.3/etc/hadoop
/usr/sbin/sshd -D &
#Format the node
hdfs datanode ${HADOOP_OPTS}
