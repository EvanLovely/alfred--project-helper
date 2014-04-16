#!/bin/bash
# $1: directory
# $2: search terms
export dir=~/active-project/_files/scripts/
export args="$1"
echo "<items>"

if [ "$args" ] 
  then
    # Filter List
    IFS=$'\n'
    for i in $(mdfind -onlyin "$dir" "$args"); do
        echo "<item arg=\"$i\" type=\"file\" uid=\"$i\"><title>`basename "$i"`</title><subtitle><![CDATA[$(cat "$i")]]></subtitle><icon type=\"fileicon\">$i</icon></item>"
    done
    unset IFS

  else
    # List All

    echo "<item><title>Add a New Script with Cmd+Enter</title><subtitle>Enter on a script runs it in a new Terminal tab; Option+Enter runs it in the background</subtitle></item>"
    IFS=$'\n'
    for i in $(find "$dir" \! -name ".DS_Store" \! -name "Icon?" -maxdepth 2 -type f); do
        echo "<item arg=\"$i\" type=\"file\"><title>`basename "$i"`</title><subtitle><![CDATA[$(cat "$i")]]></subtitle><icon type=\"fileicon\">$i</icon></item>"
    done
    unset IFS

fi

echo "</items>"
