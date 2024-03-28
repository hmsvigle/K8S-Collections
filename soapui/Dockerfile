# Base Image
FROM ubuntu:20.04

# Env Variable
ENV DEBIAN_FRONTEND=noninteractive \
    USR_HOME=/home/soapui  \
    SOAPUI_VERSION=5.6.0 \
    SOAPUI_HOME=/opt/soapui \
    PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:${SOAPUI_HOME}/bin

# Install Utilities
RUN set -x && \
    apt-get update -y && \
    apt-get install -y wget curl net-tools telnet netcat  && \
    #apt-get install -y proxychains traceroute iputils-ping  && \
    apt-get clean

# Install openjdk
RUN set -x && \
    apt-get install -y openjdk-11-jre-headless


# Install soapui
RUN set -x && \
    wget -O /tmp/soapui.tar.gz https://s3.amazonaws.com/downloads.eviware/soapuios/${SOAPUI_VERSION}/SoapUI-${SOAPUI_VERSION}-linux-bin.tar.gz && \
    tar -zxvf /tmp/soapui.tar.gz -C /opt && \
    ln -s /opt/SoapUI-${SOAPUI_VERSION} ${SOAPUI_HOME} && \
    rm /tmp/soapui.tar.gz

# Add user
RUN adduser --uid 1000 --disabled-password soapui && \
    chown -R soapui:soapui /home/soapui ${SOAPUI_HOME}/

# COPY Project.xml
COPY projects/Final-Du-Project-soapui-project.xml /opt/soapui/

WORKDIR /opt/soapui
USER soapui

# Expose port
EXPOSE 8080

# Start SoapUI
