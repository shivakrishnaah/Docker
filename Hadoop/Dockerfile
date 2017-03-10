FROM shivakrishnaah/centos:7
MAINTAINER "Krishna" shiva.krishnaah@gmail.com
WORKDIR /usr/local
RUN rpm --rebuilddb
RUN wget -q http://www-eu.apache.org/dist/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz \
    && tar -zxvf hadoop-2.7.3.tar.gz \
    && rm hadoop-2.7.3.tar.gz \
    && yum install -y rsync
RUN yum install -y which
# Disable ipv6
RUN printf "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf \
    && printf "\nnet.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf \
    && printf "\nnet.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf
COPY core-site.xml /usr/local/hadoop-2.7.3/etc/hadoop/
COPY hdfs-site.xml /usr/local/hadoop-2.7.3/etc/hadoop/
COPY yarn-site.xml /usr/local/hadoop-2.7.3/etc/hadoop/
COPY mapred-site.xml /usr/local/hadoop-2.7.3/etc/hadoop/
ENV HADOOP_HOME=/usr/local/hadoop-2.7.3 HADOOP_INSTALL=/usr/local/hadoop-2.7.3 \
    HADOOP_MAPRED_HOME=/usr/local/hadoop-2.7.3 HADOOP_COMMON_HOME=/usr/local/hadoop-2.7.3 \
    HADOOP_HDFS_HOME=/usr/local/hadoop-2.7.3 YARN_HOME=/usr/local/hadoop-2.7.3 \
    HADOOP_LIBEXEC_DIR=/usr/local/hadoop-2.7.3/libexec \
    HADOOP_COMMON_LIB_NATIVE_DIR=/usr/local/hadoop-2.7.3/lib/native \
    HADOOP_PREFIX=/usr/local/hadoop-2.7.3 \
    PATH=$PATH:/usr/local/hadoop-2.7.3/sbin:/usr/local/hadoop-2.7.3/bin \
    HADOOP_IDENT_STRING=root \
    HADOOP_CONF_DIR=/usr/local/hadoop-2.7.3/etc/hadoop
COPY ./command_runner.sh .
RUN chmod +x command_runner.sh
# Need to run Hadoop and figureout dymaic addition of files