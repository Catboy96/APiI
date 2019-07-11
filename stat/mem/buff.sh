#!/bin/bash

# HTTP header
echo "Content-type: application/json"
echo ""

# Main content
result=$( cat /proc/meminfo | grep "Buffers:" | grep -o "[0-9]*" )
echo "{\"result\":$result}"
