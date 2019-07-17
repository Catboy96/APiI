#!/bin/bash

# HTTP header
echo "Content-type: application/json"
echo ""

# Main content
result=$( cat /sys/class/thermal/thermal_zone0/temp )
temp=$( expr $result / 1000 )
ending="'C"
echo "{\"result\":\"$temp$ending\"}"
