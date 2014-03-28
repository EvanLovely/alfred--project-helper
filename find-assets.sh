#!/bin/bash

dir=~/active-project/files/assets/

echo "<items>"

if [ "$1" ] 
  then
    # Filter List
    mdfind -0 -onlyin "$dir" "$1" | xargs -0 -I {} \
      sh -c 'echo "<item arg=\"$1\" type=\"file\" uid=\"$1\"><title>`basename "$1"`</title><subtitle>In: `dirname "${1/$HOME/~}"`</subtitle><icon type=\"fileicon\">$1</icon></item>"' -- {}

  else
    # List All
    find "$dir" \! -name ".DS_Store" \! -name "Icon?" -depth 2 -type f -print0 | xargs -0 -I {} \
      sh -c 'echo "<item arg=\"$1\" type=\"file\" uid=\"$1\"><title>`basename "$1"`</title><subtitle>In: `dirname "${1/$HOME/~}"`</subtitle><icon type=\"fileicon\">$1</icon></item>"' -- {}

fi

echo "</items>"
