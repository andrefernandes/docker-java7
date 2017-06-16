# CentOS 7 + Oracle JDK 7 + Maven

FROM andrefernandes/docker-centos7-base

MAINTAINER Andre Fernandes

# Binaries are downloaded from remote sites.
# A good idea is to keep copies around (your LAN)
# and switch these URLs to your local servers.

WORKDIR /opt

RUN wget http://public.dhe.ibm.com/ibmdl/export/pub/systems/cloud/runtimes/java/7.1.4.5/linux/x86_64/ibm-java-sdk-7.1-4.5-x86_64-archive.bin -q -O ibm-java.bin && \
    echo "INSTALLER_UI=silent" > /tmp/response.properties && \
    echo "USER_INSTALL_DIR=/opt/ibm/java" >> /tmp/response.properties && \
    echo "LICENSE_ACCEPTED=TRUE" >> /tmp/response.properties && \
    mkdir -p /opt/ibm && \
    chmod +x ibm-java.bin && \
    ./ibm-java.bin -i silent -f /tmp/response.properties && \
    rm -f ibm-java.bin && \
    wget http://ftp.unicamp.br/pub/apache/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz -q -O apache-maven.tar.gz && \
    tar -xzf apache-maven.tar.gz && rm -f apache-maven.tar.gz 

ENV JAVA_HOME /opt/ibm/java
RUN alternatives --install /usr/bin/java java $JAVA_HOME/bin/java 2 && \
    alternatives --install /usr/bin/jar jar $JAVA_HOME/bin/jar 2 && \
    alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 2 && \
    alternatives --set java $JAVA_HOME/bin/java && \
    alternatives --set jar $JAVA_HOME/bin/jar && \
    alternatives --set javac $JAVA_HOME/bin/javac && \
    alternatives --install /usr/bin/mvn mvn /opt/maven/bin/mvn 1

WORKDIR /opt
RUN ln -s /opt/ibm/java java && ln -s apache-maven-3.5.0 maven

