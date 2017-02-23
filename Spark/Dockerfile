# ----- There is an sshd issue with Centos 7 so trying with Centos 6.8
FROM centos:6.8
MAINTAINER "Krishna" shiva.krishnaah@gmail.com
ENV container docker
RUN yum -y update
RUN yum install -y wget openssh-server openssh-clients \
        initscripts && yum clean all \
        && wget -q --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
                "http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jre-8u60-linux-x64.rpm" \
        && yum localinstall -y jre-8u60-linux-x64.rpm
# ---- This is to resolve the issue with sshd in Centos 7 -------
# RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
#         rm -f /lib/systemd/system/multi-user.target.wants/*; \
#         rm -f /etc/systemd/system/*.wants/*; \
#         rm -f /lib/systemd/system/local-fs.target.wants/*; \
#         rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
#         rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
#         rm -f /lib/systemd/system/basic.target.wants/*; \
#         rm -f /lib/systemd/system/anaconda.target.wants/*;
# RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
# VOLUME [ "/sys/fs/cgroup"]
# CMD ["/usr/sbin/init"]
WORKDIR /usr/local
RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz -q \
        && tar -xvf spark-2.1.0-bin-hadoop2.7.tgz \
        && mv spark-2.1.0-bin-hadoop2.7 spark
ENV PATH $PATH:/usr/local/spark/bin:/usr/local/spark/sbin
EXPOSE 7077 8080 8081 22
COPY spark.conf /usr/local/spark/conf/spark-defaults.conf
ENTRYPOINT ["/usr/local/spark/sbin/spark-daemons.sh","--config","/usr/local/spark/conf","start"]
ENTRYPOINT ["service","sshd","start"]
