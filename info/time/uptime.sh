#!/bin/bash

# HTTP header
echo "Content-type: application/json"
echo ""

# Main content
result=$( uptime -p )
echo "{\"result\":\"$result\"}"
