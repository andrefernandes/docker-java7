# CentOS 7 com Oracle JDK 7

FROM centos:centos7

MAINTAINER Andre Fernandes

RUN yum update -y; yum install net-tools tar wget -y; yum clean all

# trocar COPY por wget de jdk-7u65-linux-x64.tar.gz e apache-maven-3.2.2-bin.tar.gz
WORKDIR /opt
RUN wget http://172.15.0.50/jdk-7u65-linux-x64.tar.gz -O jdk7.tar.gz && \
    tar -xzf jdk7.tar.gz && rm jdk7.tar.gz && \
    wget http://172.15.0.50/apache-maven-3.2.2-bin.tar.gz -O apache-maven.tar.gz && \
    tar -xzf apache-maven.tar.gz && rm apache-maven.tar.gz 
#RUN echo "1" | alternatives --config java
RUN alternatives --install /usr/bin/java java /opt/jdk1.7.0_65/bin/java 2 && \
    alternatives --install /usr/bin/jar jar /opt/jdk1.7.0_65/bin/jar 2 && \
    alternatives --install /usr/bin/javac javac /opt/jdk1.7.0_65/bin/javac 2 && \
    alternatives --set java /opt/jdk1.7.0_65/bin/java && \
    alternatives --set jar /opt/jdk1.7.0_65/bin/jar && \
    alternatives --set javac /opt/jdk1.7.0_65/bin/javac && \
    alternatives --install /usr/bin/mvn mvn /opt/maven/bin/mvn 1
WORKDIR /opt
RUN ln -s jdk1.7.0_65 java && ln -s apache-maven-3.2.2 maven

