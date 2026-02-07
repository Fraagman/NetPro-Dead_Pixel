#!/bin/bash
# TCP port connectivity checker
# Usage: ./port_check.sh <host> <port>
# Example: ./port_check.sh example.com 443

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <host> <port>"
    echo "Example: $0 example.com 443"
    exit 1
fi

HOST=$1
PORT=$2
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG_FILE="/workspace/logs/port_check_${TIMESTAMP}.log"

echo "Checking connectivity to ${HOST}:${PORT}..." | tee "${LOG_FILE}"

if nc -zv -w 5 "${HOST}" "${PORT}" 2>&1 | tee -a "${LOG_FILE}"; then
    echo "SUCCESS: Port ${PORT} is open on ${HOST}" | tee -a "${LOG_FILE}"
else
    echo "FAILED: Port ${PORT} is closed or unreachable on ${HOST}" | tee -a "${LOG_FILE}"
fi

echo "Log saved to ${LOG_FILE}"
