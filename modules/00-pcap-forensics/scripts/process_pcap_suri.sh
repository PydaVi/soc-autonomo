#!/bin/bash

mkdir -p /var/log/suricata

for file in /pcap-input/*.pcap; do
  echo "Processando $file com Suricata..."
  suricata -r "$file" -l /var/log/suricata
done

mv "$file" "${file}.processed"     # marca original como processado