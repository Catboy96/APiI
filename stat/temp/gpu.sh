#!/bin/bash

# HTTP header
echo "Content-type: application/json"
echo ""

# Main content
result=$( sudo /opt/vc/bin/vcgencmd measure_temp | grep -oP "(?<=temp\=).*" )
echo "{\"result\":\"$result\"}"
