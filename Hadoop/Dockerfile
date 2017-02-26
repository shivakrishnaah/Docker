FROM shivakrishnaah/centos:7
MAINTAINER "Krishna" shiva.krishnaah@gmail.com
WORKDIR /usr/local
RUN wget -q http://www-eu.apache.org/dist/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz \
    && tar -zvf hadoop-2.7.3.tar.gz \
    && rm hadoop-2.7.3.tar.gz
ENV HADOOP_HOME=/usr/local/hadoop-2.7.3 HADOOP_INSTALL=$HADOOP_HOME \
    HADOOP_MAPRED_HOME=$HADOOP_HOME HADOOP_COMMON_HOME=$HADOOP_HOME \
    HADOOP_HDFS_HOME=$HADOOP_HOME YARN_HOME=$HADOOP_HOME \
    HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
# Need to run Hadoop and figureout dymaic addition of files