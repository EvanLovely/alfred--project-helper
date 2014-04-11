#!/bin/bash
dir=~/active-project/files/
dir2=~/active-project/docs/
find $dir -exec /opt/local/bin/tag -lNg {} \; > all-tags.txt
find $dir2 -exec /opt/local/bin/tag -lNg {} \; >> all-tags.txt
cat all-tags.txt | sort -u --output=tag-list.txt

args="$1"
echo "<items>"
if [ "$args" ]
  then
  for i in $(cat tag-list.txt | grep "$args"); do
    sh tag-template.sh $i
  done
  
else
  for i in $(cat tag-list.txt); do
    sh tag-template.sh $i
  done
fi
echo "</items>"
