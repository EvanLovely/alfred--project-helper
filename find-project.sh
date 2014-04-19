#!/bin/bash
dir=~/all-projects/
IFS=$'\n'
echo "<items>"

if [ "$1" ] 
  then
    # Filter List
    for i in $(find $dir -iname "*$1*" \! -name ".DS_Store" \! -name "Icon?" -depth 1 -type d); do
        sh result-templates/project.tpl.sh "$i"
    done
  else
    # List All
    for i in $(find $dir \! -name ".DS_Store" \! -name "Icon?" -depth 1 -type d); do
        sh result-templates/project.tpl.sh "$i"
    done
fi

echo "</items>"
unset IFS
