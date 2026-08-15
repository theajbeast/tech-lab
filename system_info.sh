#!/bin/bash

echo "=== AJ Beast Tech Lab ==="
echo "System Information"
echo "======================"

echo "Computer: $(scutil --get ComputerName)"
echo "macOS: $(sw_vers -productVersion)"
echo "User: $(whoami)"
echo "Home Directory: $HOME"
