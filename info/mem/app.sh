#!/bin/bash

# HTTP header
echo "Content-type: application/json"
echo ""

# Main content
total=$( cat /proc/meminfo | grep "MemTotal" | grep -o "[0-9]*" )
free=$( cat /proc/meminfo | grep "MemFree" | grep -o "[0-9]*" )
cache=$( cat /proc/meminfo | grep "Cached" | grep -o "[0-9]*" | head -1 )
buff=$( cat /proc/meminfo | grep "Buffers:" | grep -o "[0-9]*" )
result=$( expr $total - $free - $cache - $buff )
echo "{\"result\":$result}"
