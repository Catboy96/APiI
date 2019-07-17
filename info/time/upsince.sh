#!/bin/bash

# HTTP header
echo "Content-type: application/json"
echo ""

# Main content
result=$( uptime -s )
echo "{\"result\":\"$result\"}"
