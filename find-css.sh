#!/bin/bash

dir=~/active-project/theme/
OUTPUTSTRING="<items>
"
if [ "$1" ] 
  then
  # Filter List

  # Find all files that match, except `.DS_Store`
  args="${1// /*}" # swap spaces for *
  # @todo Create ability to search path names, search for multiple kinds of files
  TO_SEARCH=$(find $dir -type f -iname "*$args*" -iregex '.*\(scss\)' | grep -iv "DS_Store")

  else
  # List All
  TO_SEARCH=$(find $dir -type f -iregex '.*\(scss\)' -not -iname ".DS_Store")
fi

# Replacing any spaces with seperator b/c the below `for` loop is cycling on spaces
seperator="☀"
FILES=${TO_SEARCH// /$seperator}

for i in $FILES; do
 
    # Let's get our spaces we took away back by swapping it for the seperator
    path="${i//$seperator/ }"

    # Extract filename from path. remove everything up to last `/`.`
    file=`echo ${path/$dir\//}`

    OUTPUTSTRING="$OUTPUTSTRING
    <item arg='$path' type='file' valid='yes' uid='$path'>
      <title>$file</title>
      <icon type='fileicon'>$path</icon>
      </item>"
#     foldername=${i##*/};
#     file="$i";
    # echo "e $i d";
done

OUTPUTSTRING="$OUTPUTSTRING
</items>"

echo "$OUTPUTSTRING"