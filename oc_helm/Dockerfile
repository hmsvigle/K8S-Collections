
FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive \
    USR_HOME=/home/tool \
    PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/ \
    LANG=C.UTF-8 \
    KUSTOMIZE_VERSION=5.1.0 \
    HELM_VERSION=3.12.0 \
    MAVEN_HOME=/usr/share/maven \
    MAVEN_VERSION=3.9.0 \
    OC_VERSION=v4.12.10

RUN set -x && \
    apt-get update -y && \
    apt-get install -y wget curl && \
    apt-get clean

# Maven installation
RUN mkdir -p $MAVEN_HOME && curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz | \ 
    tar  --strip-components=1 -xz -C $MAVEN_HOME && ln -s $MAVEN_HOME/bin/mvn /usr/bin/mvn

# Helm Installation
RUN curl -sfL https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz -o helm.tar.gz && tar -xzvf helm.tar.gz && \
    mv linux-amd64/helm /usr/local/bin && chmod +x /usr/local/bin/helm

# RUN tar --strip-components=1 -xzvf helm.tar.gz && mv linux-amd64/helm /usr/local/bin && chmod +x /usr/local/bin/helm

# oc cli Installation 
ADD oc.tar.gz  /opt/oc/oc.tar.gz && tar --strip-components=1 -xzvf /opt/oc/oc.tar.gz -C /opt/oc/ && mv /opt/oc/oc /usr/bin/ && rm -rf /opt/oc

# Kustomize installation 
RUN curl -sfL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz \
    -o kustomize.tar.gz && tar -xf kustomize.tar.gz && mv kustomize /usr/local/bin && chmod +x /usr/local/bin/kustomize

CMD ["/usr/bin/kustomize"]

EXPOSE 8001
