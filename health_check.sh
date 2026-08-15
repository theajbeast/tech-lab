#!/bin/bash

echo "=== AJ Beast System Health Check ==="
echo

echo "System:"
sw_vers -productName
sw_vers -productVersion
echo

echo "Uptime:"
uptime
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
scutil --get LocalHostName
echo

echo "Health Check Complete"
