#!/bin/bash

# HTTP header
echo "Content-type: application/json"
echo ""

# Main content
result=$( sudo cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq )
echo "{\"result\":$result}"
