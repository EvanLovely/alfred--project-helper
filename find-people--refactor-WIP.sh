#!/bin/bash

export dir="~/active-project/_files/people"
export args="$1"
echo "<items>"

if [ "$args" ] 
  then
  args="${args// /*}"
  find $dir -type d -depth 1 -iname "*$args*" | grep -iv "DS_Store" > /tmp/find-people.txt

  args="${args// /.*}"
  grep -rliE "$args" $dir | grep -iv "DS_Store" | sed 's/\/[a-zA-Z]*\.[a-zA-Z]*//' >> /tmp/find-people.txt

  else
  # TO_SEARCH=$(find $dir -type d -depth 1)
  find $dir -type d -depth 1 -print0 | xargs -0 -I {} \
    sh -c '
    file="{}"
    echo "<item><title>$(echo $file)</title></item>" '
  
fi

# sort -u /tmp/find-people.txt | egrep --null "." | xargs -0 -I {} \
#       sh -c 'echo "
#       <item>
#         <title>$1</title>
#         <subtitle>hi</subtitle>
#         <icon type=\"fileicon\">$1</icon>
#       </item>"' -- {}


    # <item arg='$path/photo.jpg' type='file'>
    #   <title>$folder</title>
    #   <subtitle><![CDATA[$contents]]></subtitle>
    #   <icon>$path/photo.jpg</icon>
    # </item>

echo "</items>"
