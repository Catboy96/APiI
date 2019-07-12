#!/bin/bash

# HTTP header
echo "Content-type: application/json"
echo ""

# JSON template
heading="{\"result\":["
ending="]}"

# Main content
content=""
if [ -b /dev/mmcblk? ]; then
  lines_mmc=$( sudo fdisk -l /dev/mmcblk? | grep ^/dev/mmcblk | wc -l )
  for (( i = 1; i <= $lines_mmc; i++ )); do
    diskstring=$( sudo fdisk -l /dev/mmcblk? | grep ^/dev/mmcblk | sed -n "$i"p )
    device=$( echo $diskstring | awk '{print $1}' )
    start=$( echo $diskstring | awk '{print $2}' )
    end=$( echo $diskstring | awk '{print $3}' )
    sectors=$( echo $diskstring | awk '{print $4}' )
    size=$( echo $diskstring | awk '{print $5}' )
    id=$( echo $diskstring | awk '{print $6}' )
    type=$( echo $diskstring | awk '{ for(i=1; i<7; i++){ $i="" }; print $0 }' | sed 's/^ *//' )
    content="$content{\"device\":\"$device\",\"start\":\"$start\",\"end\":\"$end\",\"sectors\":\"$sectors\",\"size\":\"$size\",\"id\":\"$id\",\"type\":\"$type\"},"
  done
fi

if [ -b /dev/sd? ]; then
  lines_sd=$( sudo fdisk -l /dev/sd? | grep ^/dev/sd | wc -l )
  for (( i = 1; i <= $lines_sd; i++ )); do
    diskstring=$( sudo fdisk -l /dev/sd? | grep ^/dev/sd | sed -n "$i"p )
    device=$( echo $diskstring | awk '{print $1}' )
    start=$( echo $diskstring | awk '{print $2}' )
    end=$( echo $diskstring | awk '{print $3}' )
    sectors=$( echo $diskstring | awk '{print $4}' )
    size=$( echo $diskstring | awk '{print $5}' )
    id=$( echo $diskstring | awk '{print $6}' )
    type=$( echo $diskstring | awk '{ for(i=1; i<7; i++){ $i="" }; print $0 }' | sed 's/^ *//' )
    content="$content{\"device\":\"$device\",\"start\":\"$start\",\"end\":\"$end\",\"sectors\":\"$sectors\",\"size\":\"$size\",\"id\":\"$id\",\"type\":\"$type\"},"
  done
fi

content=$( echo $content | sed 's/.$//' )
result=$heading$content$ending
echo $result
