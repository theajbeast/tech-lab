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
df -h /
echo

echo "Network:"
scutil --get LocalHostName
echo

echo "Health Check Complete"
