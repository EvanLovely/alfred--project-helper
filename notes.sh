#!/bin/bash
export dir="$(cd $1 && pwd -P)"
export terms="$2"

echo "<items>"

if [ "$2" ] 
  then
    # Filter List
    mdfind -0 -onlyin "$dir" "$2" | xargs -0 -I {} \
      sh -c 'echo "
      <item arg=\"$1\" type=\"file\" uid=\"$1\">
        <title>$(echo "${1/$dir\/}")</title>
        <subtitle>$(/opt/local/bin/tag -Nl "$1") ~ $(if [[ "$(mdls -raw -name kMDItemContentTypeTree "$1")" == *plain-text* ]]; then
  egrep -in "${terms// /.*}" "$1"
fi)
        </subtitle>
        <icon type=\"fileicon\">$1</icon>
      </item>"' -- {}

  else
    # List All
    echo "<item arg=\"add-note\"><title>Add New Note with Cmd+Enter</title><subtitle>On Notes below: Enter to Open. Option+Enter to Append to Note. Type to filter.</subtitle></item>"
    find "$dir" \( -name .git -o -name .hg -o -name ".DS_Store" -o -name "Icon?" \) -prune -o \( -print0 \) | xargs -0 -I {} \
      sh -c 'echo "<item arg=\"$1\" type=\"file\"><title>$(echo "${1/$dir\/}")</title><subtitle>$(/opt/local/bin/tag -Nl "$1")</subtitle><icon type=\"fileicon\">$1</icon></item>"' -- {}

fi

echo "</items>"
