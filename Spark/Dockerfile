# ----- There is an sshd issue with Centos 7 so trying with Centos 6.8
FROM centos:7
MAINTAINER "Krishna" shiva.krishnaah@gmail.com
ENV container docker
RUN yum -y update
RUN yum install -y wget \
                   openssh-server \
                   epel-release \
                   openssh-clients \
                   pwgen \
                   initscripts \
        && yum clean all
RUN wget -q --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm \
        && yum localinstall -y jdk-8u102-linux-x64.rpm \
        && ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key \
        && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key \
        && ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa \
        && ssh-keygen -q -N "" -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key \
         && ssh-keygen -q -N "" -t ed25519 -f /etc/ssh/ssh_host_ed25519_key \
        && cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config \
    && sed -i "s/UsePAM.*/UsePAM yes/g" /etc/ssh/sshd_config \
    && sed -i "s/#PubkeyAuthentication.*/PubkeyAuthentication yes/g" /etc/ssh/sshd_config \
    && sed -i "s/#AuthorizedKeysFile.*/AuthorizedKeysFile \/root\/\.ssh\/authorized_keys/g" /etc/ssh/sshd_config \
    && sed -i "s/#PasswordAuthentication.*/PasswordAuthentication no/g" /etc/ssh/sshd_config \
    && sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config \
    && printf "Host * \n\t StrictHostKeyChecking no" > /root/.ssh/config
WORKDIR /usr/local
RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz -q \
        && tar -xvf spark-2.1.0-bin-hadoop2.7.tgz \
        && mv spark-2.1.0-bin-hadoop2.7 spark
ENV PATH $PATH:/usr/local/spark/bin:/usr/local/spark/sbin
ENV SPARK_HOME /usr/local/spark
ENV SPARK_NO_DAEMONIZE false
EXPOSE 7077 8080 8081 22
COPY ./* /usr/local/spark/conf/
ADD logs/ /usr/local/spark/logs
CMD ["/usr/sbin/sshd", "-D"]
