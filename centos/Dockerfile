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
                   net-tools \
        && yum clean all

RUN wget -q --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.rpm \
        && yum localinstall -y jdk-8u121-linux-x64.rpm \
        && ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key \
        && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key \
        && ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa \
        && ssh-keygen -q -N "" -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key \
        && ssh-keygen -q -N "" -t ed25519 -f /etc/ssh/ssh_host_ed25519_key \
        && cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys \
        && rm -rf jdk-8u121-linux-x64.rpm

RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config \
    && sed -i "s/UsePAM.*/UsePAM yes/g" /etc/ssh/sshd_config \
    && sed -i "s/#PubkeyAuthentication.*/PubkeyAuthentication yes/g" /etc/ssh/sshd_config \
    && sed -i "s/#AuthorizedKeysFile.*/AuthorizedKeysFile \/root\/\.ssh\/authorized_keys/g" /etc/ssh/sshd_config \
    && sed -i "s/#PasswordAuthentication.*/PasswordAuthentication no/g" /etc/ssh/sshd_config \
    && sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config \
    && printf "Host * \n\t StrictHostKeyChecking no" > /root/.ssh/config
ENV JAVA_HOME=/usr/java/jdk1.8.0_121 JRE_HOME=/usr/java/jdk1.8.0_121/jre \
    CLASSPATH=$JAVA_HOME/lib:. PATH=$PATH:$JAVA_HOME/bin