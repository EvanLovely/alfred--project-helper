#!/bin/bash
source bash_functions
export dir=$(cd $HOME/active-project/theme/ && pwd -P)
# export dir=~/active-project/theme/
arg="$1"
extension=$(getsetting css_extension)
file_paths=$(find "$dir" -type f -follow -name "*.$extension" -not -path "*/.*")

IFS=$'\n'
echo "<items>"

if [ "$arg" ] 
  then
    # Filter List

    # Find chunks of text in style files that are at the far left and end with a "{"
    egrep -lr --exclude-dir ".*" --include "*.$extension" "^\S.*${arg// /.*}.*{$" $dir > /tmp/css-files.txt
    # A list of all style files filtered by name and path name
    echo "$file_paths"  | egrep "${arg// /.*}" >> /tmp/css-files.txt
    # All theme files tagged with the argument
    mdfind -onlyin $dir "tag:$arg" >> /tmp/css-files.txt

    for i in $(cat /tmp/css-files.txt | sort -u); do
      sh result-templates/css.tpl.sh "$i" "$arg"
    done
  else
    # List All
    for i in $file_paths; do
      sh result-templates/css.tpl.sh "$i"
      let ++count
      if [[ count -gt 20 ]]; then
        unset count
        break
      fi
    done
fi

echo "</items>"
unset IFS
