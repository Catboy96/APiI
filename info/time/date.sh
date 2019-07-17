#!/bin/bash

# HTTP header
echo "Content-type: application/json"
echo ""

# Main content
result=$( date )
echo "{\"result\":\"$result\"}"
