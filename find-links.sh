#!/bin/bash
IFS=$'\n'
dir=~/active-project/_files/links
export dir="$(cd $dir && pwd -P)"
echo "<items>"

if [ "$1" ] 
  then
    # Filter List
    for i in $(mdfind -onlyin "$dir" "$1 NOT kind:folder"); do
      sh result-templates/links.tpl.sh "$i"
    done

  else
    # List All
    echo "<item arg=\"add-link\"><title>Add New Link</title><subtitle>On links below: Hold Cmd to Open in Dev Browser. Type to filter.</subtitle></item>"
    for i in $(find "$dir" -name "*.webloc"); do
      sh result-templates/links.tpl.sh "$i" --no-uid
    done
fi

echo "</items>"
unset IFS
