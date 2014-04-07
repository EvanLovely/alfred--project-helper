#!/bin/bash

dir=~/active-project/files/links
export dir="$(cd $dir && pwd -P)"
echo "<items>"

if [ "$1" ] 
  then
    # Filter List
    mdfind -0 -onlyin "$dir" "$1 NOT kind:folder" | xargs -0 -I {} \
      sh -c 'echo "<item arg=\"$1\" type=\"file\" uid=\"$1\"><title>$(echo "${1/$dir\/}" | sed "s/.webloc//")</title><subtitle>$(/opt/local/bin/tag -Nl "$1") ~ <![CDATA[$(grep "string" "$1" | sed "s/<string>//" | sed "s/<\/string>//")]]></subtitle><icon type=\"fileicon\">$1</icon></item>"' -- {}

  else
    # List All
    echo "<item arg=\"add-link\"><title>Add New Link.</title><subtitle>On links below: Hold Cmd to Open in Dev Browser. Type to filter.</subtitle></item>"
    find "$dir" \( -name .git -o -name .hg -o -name ".DS_Store" -o -name "Icon?" \) -prune -o \( -type f -print0 \) | xargs -0 -I {} \
      sh -c 'echo "<item arg=\"$1\" type=\"file\"><title>$(echo "${1/$dir\/}" | sed "s/.webloc//")</title><subtitle>$(/opt/local/bin/tag -Nl "$1") ~ <![CDATA[$(grep "string" "$1" | sed "s/<string>//" | sed "s/<\/string>//")]]></subtitle><icon type=\"fileicon\">$1</icon></item>"' -- {}

fi

echo "</items>"
