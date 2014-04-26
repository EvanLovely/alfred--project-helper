#!/bin/bash
export dir="$(cd $1 && pwd -P)"
IFS=$'\n'
# @todo:
# - Show Spotlight Comments without big lag - `$(mdls -name kMDItemFinderComment -raw "$1")`
# - Have search be able to look in folder titles (`kMDItemPath` doesn't let you query against it: http://stackoverflow.com/questions/1341590/no-results-in-spotlight-in-searches-against-kmditempath)

echo "<items>"

if [ "$2" ] 
  then
    # Filter List
    for i in $(mdfind -onlyin "$dir" "$2 NOT kind:folder"); do
          sh result-templates/snippet.tpl.sh "$i"
    done

  else
    # List All
    echo "<item arg=\"add-snippet\"><title>Add New Snippet</title><subtitle>On Snippets below: Enter to Copy and Insert. Hold Cmd to Just Copy. Type to filter.</subtitle></item>"
    for i in $(find "$dir" -type f -not -name "*DS_Store*"); do
          sh result-templates/snippet.tpl.sh "$i" --no-uid
          let ++count
          if [[ count -gt 20 ]]; then
            unset count
            break
          fi
    done

fi

echo "</items>"

unset IFS
