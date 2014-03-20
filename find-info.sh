#!/bin/bash

OUTPUTSTRING="<items>
"
if [ "$1" ] 
  then
  TO_SEARCH=$(find ~/active-project/files/info -not -iname .DS_Store -type f -iname *$1*)
  else
  TO_SEARCH=$(find ~/active-project/files/info -not -iname .DS_Store -type f)
fi
FILES=${TO_SEARCH// /_}

for i in $FILES; do
    path="${i//_/ }"
    file=`echo $path | sed "s/.*\///" | sed "s/\.txt//"`
    OUTPUTSTRING="$OUTPUTSTRING
    <item arg='$path' type='file'>
      <title>$file</title>
      <subtitle>Copy: `cat "$path"`</subtitle>
      </item>"
#     foldername=${i##*/};
#     file="$i";
    # echo "e $i d";
done

OUTPUTSTRING="$OUTPUTSTRING
</items>"

echo "$OUTPUTSTRING"