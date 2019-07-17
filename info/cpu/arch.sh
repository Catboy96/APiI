#!/bin/bash

# HTTP header
echo "Content-type: application/json"
echo ""

# Main content
result=$( uname -m )
echo "{\"result\":\"$result\"}"
