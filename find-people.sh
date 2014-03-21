#!/bin/bash

OUTPUTSTRING="<items>
"
if [ "$1" ] 
  then
  TO_SEARCH=$(find ~/active-project/files/people -type d -depth 1 -iname *$1*)
  else
  TO_SEARCH=$(find ~/active-project/files/people -type d -depth 1)

  OUTPUTSTRING="$OUTPUTSTRING
  <item>
    <title>People of this Project:</title>
    <subtitle>Return: copy email ___ Cmd+Return: Edit ___ Cmd+Y: Big Photo</subtitle>
  </item>"

fi
FILES=${TO_SEARCH// /_}


for i in $FILES; do
    path="${i//_/ }"
    folder=`echo $path | sed "s/.*\///" | sed "s/\.txt//"`
    contents=`cat "$path/info.txt" | tr -d '\n'`
    OUTPUTSTRING="$OUTPUTSTRING
    <item arg='$path/photo.jpg' type='file'>
      <title>$folder</title>
      <subtitle><![CDATA[$contents]]></subtitle>
      <icon>$path/photo.jpg</icon>
    </item>"
#     foldername=${i##*/};
#     file="$i";
    # echo "e $i d";
done

OUTPUTSTRING="$OUTPUTSTRING
</items>"

echo "$OUTPUTSTRING"