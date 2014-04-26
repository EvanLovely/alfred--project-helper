#!/bin/bash
# $1: directory
# $2: search terms
export dir="$(cd $1 && pwd -P)"
export args="$2"
IFS=$'\n'

echo "<items>"

if [ "$args" ] 
  then
    # Filter List
    for i in $(mdfind -onlyin "$dir" "$args"); do
        sh result-templates/generic.tpl.sh "$i"
    done
  else
    # List All
    for i in $(find "$dir" \! -name ".DS_Store" \! -name "Icon?" -type f); do
        sh result-templates/generic.tpl.sh "$i"
        let ++count
        if [[ count -gt 20 ]]; then
        unset count
        break
        fi
    done
fi

echo "</items>"
unset IFS
