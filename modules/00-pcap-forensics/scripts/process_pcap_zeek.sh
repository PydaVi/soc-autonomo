#!/bin/bash
LOG_DIR="/usr/local/zeek/spool/logs"

mkdir -p "$LOG_DIR"

for pcap in /pcap-input/*.pcap; do
    [ -f "$pcap" ] || continue
    echo "Processando: $pcap"
    
    base=$(basename "$pcap")
    cp "$pcap" "$LOG_DIR/$base"

    cd "$LOG_DIR" || exit 1
    zeek -r "$base" /usr/local/zeek/share/zeek/site/local.zeek

    rm "$base"                          # remove cópia temporária
done