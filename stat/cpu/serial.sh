#!/bin/bash

# HTTP header
echo "Content-type: application/json"
echo ""

# Main content
result=$( cat /proc/cpuinfo | grep -oP "(?<=Serial\t\t: ).*" )
echo "{\"result\":\"$result\"}"
