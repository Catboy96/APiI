#!/bin/bash

# HTTP header
echo "Content-type: application/json"
echo ""

# JSON template
heading="{\"result\":["
ending="]}"

# Main content
lines=$( df -h | grep -P "^/dev/" | wc -l )

content=""
for (( i = 1; i <= $lines; i++ )); do
  diskstring=$( df -h | grep -P "^/dev/" | sed -n "$i"p )
  fs=$( echo $diskstring | awk '{print $1}' )
  size=$( echo $diskstring | awk '{print $2}' )
  used=$( echo $diskstring | awk '{print $3}' )
  avail=$( echo $diskstring | awk '{print $4}' )
  usep=$( echo $diskstring | awk '{print $5}' )
  mounted=$( echo $diskstring | awk '{print $6}' )
  content="$content{\"fs\":\"$fs\",\"size\":\"$size\",\"used\":\"$used\",\"avail\":\"$avail\",\"usep\":\"$usep\",\"mounted\":\"$mounted\"},"
done

content=$( echo $content | sed 's/.$//' )
result=$heading$content$ending
echo $result
