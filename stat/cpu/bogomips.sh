#!/bin/bash

# HTTP header
echo "Content-type: application/json"
echo ""

# Main content
result=$( cat /proc/cpuinfo | grep "BogoMIPS" | grep -o "[0-9]*\.[0-9]*" | head -1 )
echo "{\"result\":\"$result\"}"
