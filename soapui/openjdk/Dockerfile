FROM ubuntu:20.04

# Env Variable
ENV DEBIAN_FRONTEND=noninteractive \
    USR_HOME=/home/soapui  \
    PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Install Utilities
RUN set -x && \
    apt-get update -y && \
    apt-get install -y wget curl net-tools telnet netcat  && \
    #apt-get install -y proxychains traceroute iputils-ping  && \
    apt-get clean

# Install openjdk
RUN set -x && \
    apt-get install -y openjdk-11-jre-headless

ENTRYPOINT [java -version]
