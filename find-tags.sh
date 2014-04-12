#!/bin/bash
dir=~/active-project
IFS=$'\n'
export all_tags=$(find -x $dir -follow -exec /opt/local/bin/tag -lNg {} +\;)
export tags=$(echo "$all_tags" | sort -fu)

args="$1"
echo "<items>"
if [ "$args" ]
  then
  for i in $(echo "$tags" | egrep "${args// /.*}"); do
    sh tag-template.sh $i
  done
  
else
  for i in $(echo "$tags"); do
    sh tag-template.sh $i
  done
fi
echo "</items>"

unset IFS