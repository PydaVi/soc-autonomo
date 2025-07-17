FROM ubuntu:22.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    zeek \
    jq \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY modules/00-pcap-forensics/config/local.zeek /usr/local/zeek/share/zeek/site/local.zeek
COPY modules/00-pcap-forensics/scripts/process_pcap.sh /process_pcap.sh

WORKDIR /pcap-input
