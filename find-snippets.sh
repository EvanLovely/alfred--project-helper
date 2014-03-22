#!/bin/bash

dir=~/active-project/files/snippets
OUTPUTSTRING="<items>
"
if [ "$1" ] 
  then
  # Filter List

  # Find all files that match, except `.DS_Store`, and add them to a new text file
  args="${1// /*}" # swap spaces for *
  find $dir -type f -iname "*$args*" | grep -iv "DS_Store" > /tmp/find-snippets.txt

  # Find all files that contain the match and add them to that same text file
  grep -rli "$1" $dir | grep -iv "DS_Store" >> /tmp/find-snippets.txt

  # Export that list to this variable while ensuring there are no duplicates
  TO_SEARCH="`sort -u /tmp/find-snippets.txt`"

  else
  # List All
  TO_SEARCH=$(find $dir -not -iname .DS_Store -type f)
fi

# Replacing any spaces with _ b/c the below `for` loop is cycling on spaces
seperator="☀"
FILES=${TO_SEARCH// /$seperator}

for i in $FILES; do
 
    # Let's get our spaces we took away back by swapping it for the seperator
    path="${i//$seperator/ }"

    # Extract filename from path. 1st sed: remove everything up to last `/`. 2nd sed: remove `.txt` @todo yank all file extensions, not just just `.txt`
    file=`echo ${path/$dir\//} | sed "s/\.txt//"`

    # Contents of the file, with any new lines removed
    contents=`cat "$path" | tr -d '\n'`

    OUTPUTSTRING="$OUTPUTSTRING
    <item arg='$path' type='file' uid='$path'>
      <title>$file</title>
      <subtitle>Copy: <![CDATA[$contents]]></subtitle>
      <icon type='fileicon'>$path</icon>
      </item>"
#     foldername=${i##*/};
#     file="$i";
    # echo "e $i d";
done

OUTPUTSTRING="$OUTPUTSTRING
</items>"

echo "$OUTPUTSTRING"