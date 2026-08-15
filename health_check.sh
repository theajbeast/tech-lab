#!/bin/bash

echo "=== AJ Beast System Health Check ==="
echo

echo "System:"
sw_vers -productName
sw_vers -productVersion
echo

echo "CPU/System Load:"
LOAD_1MIN=$(uptime | awk -F'load averages: ' '{print $2}' | awk '{print $1}')
echo "1-Minute Load: ${LOAD_1MIN}"

if awk "BEGIN {exit !($LOAD_1MIN > 2.0)}"; then
    echo "Load Status: WARNING"
else
    echo "Load Status: OK"
fi
echo

echo "Disk Usage:"

DISK_USAGE=$(df -h / | tail -1 | awk '{print $5}' | tr -d '%')

echo "Current Usage: ${DISK_USAGE}%"

if [ "$DISK_USAGE" -gt 80 ]; then
    echo "Disk Status: WARNING"
else
    echo "Disk Status: OK"
fi
echo

echo "Network:"

if ping -c 1 -W 2 8.8.8.8 >/dev/null 2>&1; then
    echo "Status: ONLINE"
else
    echo "Status: OFFLINE"
fi
echo

echo "Health Check Complete"
