#!/bin/bash
export dir="$(cd $1 && pwd -P)"

echo "<items>"

if [ "$2" ] 
  then
    # Filter List
    find "$dir" \( -name .git -o -name .hg -o -name ".DS_Store" -o -name "Icon?" \) -prune -o \( -type f -iname "*${2// /*}*" -print0 \) | xargs -0 -I {} \
      sh -c 'echo "<item arg=\"$1\" type=\"file\" uid=\"$1\"><title>$(echo "${1/$dir\/}")</title><subtitle>$(/opt/local/bin/tag -Nl "$1")</subtitle><icon type=\"fileicon\">$1</icon></item>"' -- {}

  else
    # List All
    find "$dir" \( -name .git -o -name .hg -o -name ".DS_Store" -o -name "Icon?" \) -prune -o \( -type f -print0 \) | xargs -0 -I {} \
      sh -c 'echo "<item arg=\"$1\" type=\"file\"><title>$(echo "${1/$dir\/}")</title><subtitle>$(/opt/local/bin/tag -Nl "$1")</subtitle><icon type=\"fileicon\">$1</icon></item>"' -- {}

fi

echo "</items>"
