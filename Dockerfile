FROM ubuntu:22.04

# 1. Instala o Zeek (como antes)
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl gnupg2 && \
    echo "deb http://download.opensuse.org/repositories/security:/zeek/xUbuntu_22.04/ /" | tee /etc/apt/sources.list.d/security:zeek.list && \
    curl -fsSL https://download.opensuse.org/repositories/security:zeek/xUbuntu_22.04/Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/security_zeek.gpg > /dev/null

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    zeek jq python3-pip && \
    rm -rf /var/lib/apt/lists/*

# 2. Instala o Filebeat (Novo!)
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.12.0-linux-x86_64.tar.gz && \
    tar xzvf filebeat-8.12.0-linux-x86_64.tar.gz && \
    mv filebeat-8.12.0-linux-x86_64 /usr/share/filebeat && \
    rm filebeat-8.12.0-linux-x86_64.tar.gz

# 3. Configurações
ENV PATH="/opt/zeek/bin:/usr/share/filebeat:${PATH}"
COPY modules/00-pcap-forensics/config/local.zeek /opt/zeek/share/zeek/site/local.zeek
COPY filebeat.yml /usr/share/filebeat/filebeat.yml 
COPY /modules/00-pcap-forensics/scripts/process_pcap.sh /process_pcap.sh
WORKDIR /pcap-input
