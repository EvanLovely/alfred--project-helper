#!/bin/bash

dir=~/all-projects/
echo "<items>"

if [ "$1" ] 
  then
    # Filter List
    find $dir -iname "*$1*" \! -name ".DS_Store" \! -name "Icon?" -depth 1 -type d -print0 | xargs -0 -I {} \
      sh -c 'echo "<item arg=\"$1\" type=\"file\" uid=\"$1\"><title>`basename "$1"`</title><icon type=\"fileicon\">$1</icon></item>"' -- {}

  else
    # List All
    find $dir \! -name ".DS_Store" \! -name "Icon?" -depth 1 -type d -print0 | xargs -0 -I {} \
      sh -c 'echo "<item arg=\"$1\" type=\"file\" uid=\"$1\"><title>`basename "$1"`</title><icon type=\"fileicon\">$1</icon></item>"' -- {}

fi

echo "</items>"
