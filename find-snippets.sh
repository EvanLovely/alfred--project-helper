#!/bin/bash
# $1: directory
# $2: search terms

echo "<items>"

if [ "$2" ] 
  then
    # Filter List
    mdfind -0 -onlyin "$1" "$2 NOT kind:folder" | xargs -0 -I {} \
      sh -c 'echo "<item arg=\"$1\" type=\"file\" uid=\"$1\"><title>$(basename "$1")</title><subtitle><![CDATA[$(cat "$1")]]></subtitle><icon type=\"fileicon\">$1</icon></item>"' -- {}

  else
    # List All
    find "$1" \! -name ".DS_Store" \! -name "Icon?" -maxdepth 2 -type f -print0 | xargs -0 -I {} \
      sh -c 'echo "<item arg=\"$1\" type=\"file\" uid=\"$1\"><title>$(basename "$1")</title><subtitle><![CDATA[$(cat "$1")]]></subtitle><icon type=\"fileicon\">$1</icon></item>"' -- {}

fi

echo "</items>"
