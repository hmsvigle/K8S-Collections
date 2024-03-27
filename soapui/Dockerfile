FROM openjdk:11-jre
  
# Set environment variables
ENV SOAPUI_VERSION=5.6.0
ENV SOAPUI_HOME=/opt/soapui

# Download and install SoapUI
RUN apt-get update && \
    apt-get install -y wget && \
    wget -O /tmp/soapui.tar.gz https://s3.amazonaws.com/downloads.eviware/soapuios/${SOAPUI_VERSION}/SoapUI-${SOAPUI_VERSION}-linux-bin.tar.gz &&
    tar -zxvf /tmp/soapui.tar.gz -C /opt && \
    ln -s /opt/SoapUI-${SOAPUI_VERSION} ${SOAPUI_HOME} && \
    rm /tmp/soapui.tar.gz

# Add SoapUI to PATH
ENV PATH="${SOAPUI_HOME}/bin:${PATH}"

# Expose port
EXPOSE 8080

# Add user
#RUN adduser --uid 1000 --disabled-password soapui && \
#    chown soapui:soapui 

WORKDIR /opt/soapui
#USER soapui 
# Start SoapUI
CMD ["sh", "-c", "soapui.sh"]
