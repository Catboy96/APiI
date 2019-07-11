#!/bin/bash

# HTTP header
echo "Content-type: application/json"
echo ""

# Main content
result=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo | sed 's/^[ \t]*//;s/[ \t]*$//' )
echo "{\"result\":\"$result\"}"
