# CentOS 7 + Oracle JDK 7 + Maven

FROM andrefernandes/docker-centos7-base

MAINTAINER Andre Fernandes

# Binaries are downloaded from remote sites.
# A good idea is to keep copies around (your LAN)
# and switch these URLs to your local servers.

WORKDIR /opt

RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-linux-x64.tar.gz -q -O jdk7.tar.gz && \
    tar -xzf jdk7.tar.gz && rm jdk7.tar.gz && \
    wget http://ftp.unicamp.br/pub/apache/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.tar.gz -q -O apache-maven.tar.gz && \
    tar -xzf apache-maven.tar.gz && rm apache-maven.tar.gz 

RUN alternatives --install /usr/bin/java java /opt/jdk1.7.0_67/bin/java 2 && \
    alternatives --install /usr/bin/jar jar /opt/jdk1.7.0_67/bin/jar 2 && \
    alternatives --install /usr/bin/javac javac /opt/jdk1.7.0_67/bin/javac 2 && \
    alternatives --set java /opt/jdk1.7.0_67/bin/java && \
    alternatives --set jar /opt/jdk1.7.0_67/bin/jar && \
    alternatives --set javac /opt/jdk1.7.0_67/bin/javac && \
    alternatives --install /usr/bin/mvn mvn /opt/maven/bin/mvn 1

WORKDIR /opt
RUN ln -s jdk1.7.0_67 java && ln -s apache-maven-3.2.3 maven

