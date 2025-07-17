#!/bin/bash
for pcap in /pcap-input/*.pcap; do
    [ -e "$pcap" ] || continue
    zeek -r "$pcap" /usr/local/zeek/share/zeek/site/local.zeek
    mv "$pcap" "${pcap}.processed"
done
