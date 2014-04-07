#!/bin/bash

dir=~/active-project/files/links/
echo "<items>"

if [ "$1" ] 
  then
    # Filter List
    mdfind -0 -onlyin "$dir" "$1 NOT kind:folder" | xargs -0 -I {} \
      sh -c 'echo "<item arg=\"$1\" type=\"file\" uid=\"$1\"><title>$(basename "$1")</title><icon type=\"fileicon\">$1</icon></item>"' -- {}

  else
    # List All
    find "$dir" \! -name ".DS_Store" \! -name "Icon?" -maxdepth 2 -type f -print0 | xargs -0 -I {} \
      sh -c 'echo "<item arg=\"$1\" type=\"file\" uid=\"$1\"><title>$(basename "$1")</title><icon type=\"fileicon\">$1</icon></item>"' -- {}

fi

echo "</items>"
