FROM  dockerhub/i3-mirror/docker.io_ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive \
    USR_HOME=/home/tool \
    PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN set -x && \
    apt-get update -y && \
#    apt-get install -y software-properties-common && \
#    apt-get update -y && \
    apt-get install -y wget curl iputils-ping net-tools telnet traceroute  netcat dnsutils && \
    apt-get install -y proxychains && \
    apt-get clean

RUN set -x && \
    curl -LO "https://dl.k8s.io/release/v1.24.1/bin/linux/amd64/kubectl" && \
    mv kubectl /usr/local/bin/
RUN set -x && \
    useradd tool && \
    [ `id -u tool` -eq 1000 ] && \
    [ `id -g tool` -eq 1000 ] && \
    mkdir -p /home/tool && \
    chown -R tool:tool /home/tool/

WORKDIR $USR_HOME
