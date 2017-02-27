FROM shivakrishnaah/centos:7
MAINTAINER "Krishna" shiva.krishnaah@gmail.com
WORKDIR /usr/local
RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz -q \
        && tar -xvf spark-2.1.0-bin-hadoop2.7.tgz \
        && mv spark-2.1.0-bin-hadoop2.7 spark \
        && rm -rf spark-2.1.0-bin-hadoop2.7.tgz
ENV PATH $PATH:/usr/local/spark/bin:/usr/local/spark/sbin
ENV SPARK_HOME /usr/local/spark
ENV SPARK_NO_DAEMONIZE false