#!/bin/bash
export dir="$(cd $1 && pwd -P)"
# @todo:
# - Show Spotlight Comments without big lag - `$(mdls -name kMDItemFinderComment -raw "$1")`
# - Have search be able to look in folder titles (`kMDItemPath` doesn't let you query against it: http://stackoverflow.com/questions/1341590/no-results-in-spotlight-in-searches-against-kmditempath)

echo "<items>"

if [ "$2" ] 
  then
    # Filter List
    mdfind -0 -onlyin "$dir" "$2 NOT kind:folder" | xargs -0 -I {} \
      sh -c 'echo "<item arg=\"$1\" type=\"file\" uid=\"$1\"><title>$(echo "${1/$dir\/}")</title><subtitle>$(/opt/local/bin/tag -Nl "$1") ~ <![CDATA[$(cat "$1")]]></subtitle><icon type=\"fileicon\">$1</icon></item>"' -- {}

  else
    # List All
    find "$dir" \( -name .git -o -name .hg -o -name ".DS_Store" -o -name "Icon?" \) -prune -o \( -type f -print0 \) | xargs -0 -I {} \
      sh -c 'echo "<item arg=\"$1\" type=\"file\" uid=\"$1\"><title>$(echo "${1/$dir\/}")</title><subtitle>$(/opt/local/bin/tag -Nl "$1") ~ <![CDATA[$(cat "$1")]]></subtitle><icon type=\"fileicon\">$1</icon></item>"' -- {}

fi

echo "</items>"
