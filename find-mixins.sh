#!/bin/bash
export dir="${1/~/$HOME}"
IFS=$'\n'
echo "<items>"

if [ "$2" ] 
  then
    # Filter List
    for i in $(find $dir -name "*.scss" -exec grep -rin "@mixin.*${2// /.*}" {} +\;); do
        sh result-templates/mixin.tpl.sh "$i"
    done

  else
    # List All
    for i in $(find $dir -name "*.scss" -exec grep -irn "@mixin" {} +\;); do
        sh result-templates/mixin.tpl.sh "$i"
    done
fi

echo "</items>"

unset IFS
