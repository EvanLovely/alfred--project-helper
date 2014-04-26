#!/bin/bash

dir=~/active-project/_files/people
OUTPUTSTRING="<items>
"
if [ "$1" ] 
  then
  args="${1// /*}"
  find $dir -type d -depth 1 -iname "*$args*" | grep -iv "DS_Store" > /tmp/find-people.txt

  args="${1// /.*}"
  grep -rliE "$args" $dir | grep -iv "DS_Store" | sed 's/\/[a-zA-Z]*\.[a-zA-Z]*//' >> /tmp/find-people.txt

  # Export that list to this variable while ensuring there are no duplicates
  TO_SEARCH="`sort -u /tmp/find-people.txt`"

  else
  TO_SEARCH=$(find $dir -type d -depth 1)

  OUTPUTSTRING="$OUTPUTSTRING
  <item arg=',p add person'>
    <title>People of this Project:</title>
    <subtitle>Return: copy email ___ Cmd+Return: Edit ___ Cmd+Y: Big Photo</subtitle>
  </item>"

fi


# Replacing any spaces with seperator b/c the below `for` loop is cycling on spaces
seperator="☀"
FILES=${TO_SEARCH// /$seperator}

for i in $FILES; do

    # Let's get our spaces we took away back by swapping it for the seperator
    path="${i//$seperator/ }"

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