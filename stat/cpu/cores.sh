#!/bin/bash

# HTTP header
echo "Content-type: application/json"
echo ""

# Main content
result=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
echo "{\"result\":\"$result\"}"
