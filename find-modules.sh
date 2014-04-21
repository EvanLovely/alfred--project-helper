#!/bin/bash
source bash_functions
export dir=$(cd $1 && pwd -P)
# export dir=~/active-project/theme/
arg="$2"
file_paths=$(find $dir -type f -follow -not -path "*/.*")

IFS=$'\n'
echo "<items>"

if [ "$arg" ] 
  then
    # Filter List

    # Find chunks of text in style files that are at the far left and end with a "{"
    egrep -lr --exclude-dir ".*" "^\S.*${arg// /.*}" $dir > /tmp/module-files.txt
    # A list of all style files filtered by name and path name
    echo "$file_paths"  | egrep "${arg// /.*}" >> /tmp/module-files.txt
    # All theme files tagged with the argument
    mdfind -onlyin $dir "tag:$arg" >> /tmp/module-files.txt

    for i in $(cat /tmp/module-files.txt | sort -u); do
      sh result-templates/modules.tpl.sh "$i" "$arg"
    done
  else
    # List All
    for i in $file_paths; do
      sh result-templates/modules.tpl.sh "$i"
    done
fi

echo "</items>"
unset IFS
