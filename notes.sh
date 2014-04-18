#!/bin/bash
export dir="$(cd $1 && pwd -P)"
export terms="$2"
IFS=$'\n'
echo "<items>"

if [ "$2" ] 
  then
    # Filter List
    for i in $(mdfind -onlyin "$dir" "$2"); do
      sh result-templates/note.tpl.sh "$i" --show-contents
    done
  else
    # List All
    echo "<item arg=\"add-note\"><title>Add New Note with Cmd+Enter</title><subtitle>On Notes below: Enter to Open. Option+Enter to Append to Note. Type to filter.</subtitle></item>"
    for i in $(find "$dir" -type f -not -name ".DS_Store"); do
      sh result-templates/note.tpl.sh "$i" --no-uid
    done
    
fi

echo "</items>"
unset IFS
