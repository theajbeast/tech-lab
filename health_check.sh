#!/bin/bash

OVERALL_STATUS="HEALTHY"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "=== AJ Beast System Health Check ==="
echo "Timestamp: $TIMESTAMP"
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
    OVERALL_STATUS="WARNING"
else
    echo "Load Status: OK"
fi
echo

echo "Disk Usage:"

DISK_USAGE=$(df -h / | tail -1 | awk '{print $5}' | tr -d '%')

echo "Current Usage: ${DISK_USAGE}%"

if [ "$DISK_USAGE" -gt 80 ]; then
    echo "Disk Status: WARNING"
    OVERALL_STATUS="WARNING"
else
    echo "Disk Status: OK"
fi
echo

echo "Memory:"

MEMORY_FREE=$(memory_pressure -Q | awk -F': ' ' /System-wide memory free percentage/ {print $2}' | tr -d '%')

echo "Free Memory: ${MEMORY_FREE}%"

if [ "$MEMORY_FREE" -lt 50 ]; then
    echo "Memory Status: WARNING"
    OVERALL_STATUS="WARNING"
else
    echo "Memory Status: OK"
fi
echo

echo "Network:"

if ping -c 1 8.8.8.8 > /dev/null 2>&1; then
    echo "Network Status: ONLINE"
else
    echo "Network Status: OFFLINE"
    OVERALL_STATUS="WARNING"
fi
echo

echo "Health Check Complete"

echo
echo "=============================="
echo "OVERALL SYSTEM STATUS: $OVERALL_STATUS"
echo "=============================="
