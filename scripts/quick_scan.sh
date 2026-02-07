#!/bin/bash
# Quick network discovery scan for authorized networks only
# Usage: ./quick_scan.sh <target_network>
# Example: ./quick_scan.sh 192.168.1.0/24

if [ -z "$1" ]; then
    echo "Usage: $0 <target_network>"
    echo "Example: $0 192.168.1.0/24"
    exit 1
fi

TARGET=$1
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT_FILE="/workspace/logs/scan_${TIMESTAMP}.txt"

echo "Starting network scan on ${TARGET}..."
echo "Results will be saved to ${OUTPUT_FILE}"

nmap -sn -oN "${OUTPUT_FILE}" "${TARGET}"

echo "Scan complete. Results saved to ${OUTPUT_FILE}"
