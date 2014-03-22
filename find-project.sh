#!/bin/bash

dir=~/all-projects/
OUTPUTSTRING="<items>
"
if [ "$1" ] 
  then
  # Filter List

  # Find all files that match, except `.DS_Store`, and add them to a new text file
  args="${1// /*}" # swap spaces for *
  TO_SEARCH=$(find $dir -type d -depth 1 -iname "*$args*" | grep -iv "DS_Store")

  else
  # List All
  TO_SEARCH=$(find $dir -type d -depth 1 -not -iname ".DS_Store")
fi

# Replacing any spaces with _ b/c the below `for` loop is cycling on spaces
seperator="_"
FILES=${TO_SEARCH// /$seperator}

for i in $FILES; do
 
    # Let's get our spaces we took away back by swapping it for the seperator
    path="${i//$seperator/ }"

    # Extract filename from path. remove everything up to last `/`.`
    file=`echo ${path/$dir\//}`

    OUTPUTSTRING="$OUTPUTSTRING
    <item arg='$path' type='file'>
      <title>$file</title>
      </item>"
#     foldername=${i##*/};
#     file="$i";
    # echo "e $i d";
done

OUTPUTSTRING="$OUTPUTSTRING
</items>"

echo "$OUTPUTSTRING"