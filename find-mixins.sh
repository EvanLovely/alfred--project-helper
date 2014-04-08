#!/bin/bash
export dir="${1/~/$HOME}"

echo "<items>"

if [ "$2" ] 
  then
    # Filter List
    find $dir -name "*.scss" -print0 | xargs -0 -I {} egrep -irn "@mixin.*${2// /.*}" {} | xargs -I {} \
      sh -c 'mixin=$(echo $1 | sed "s/^.*@mixin //" | sed "s/{//") && echo "<item arg=\"$(echo $mixin | sed "s/@mixin //")\"><title>@mixin $mixin</title><subtitle>$(echo ${1/$dir\//} | sed "s/\:@mixin .*//")</subtitle></item>"' -- {}

  else
    # List All
     find $dir -name "*.scss" -print0 | xargs -0 -I {} grep -irn "@mixin" {} | xargs -I {} \
      sh -c 'mixin=$(echo $1 | sed "s/^.*@mixin //" | sed "s/{//") && echo "<item arg=\"$(echo $mixin | sed "s/@mixin //")\"><title>@mixin $mixin</title><subtitle>$(echo ${1/$dir\//} | sed "s/\:@mixin .*//")</subtitle></item>"' -- {}

fi

echo "</items>"

