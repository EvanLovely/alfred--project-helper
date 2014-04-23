#!/bin/bash
echo "<?xml version='1.0'?>"
args="$1"
IFS=$'\n'
folder_listing=$(cat ~/active-project/_files/settings/folders.yml | egrep -i "${args// /.*}")
all_aliases=""
for i in $folder_listing; do
  alias="${i%%:*}"
  all_aliases="$all_aliases $alias"
done

echo "<items>"
if [[ "$all_aliases" == "" ]]; then
   echo "<item valid=\"no\">
      <title>No Items Found</title>
      <subtitle>$arg</subtitle>
      <icon>icons/folder.png</icon>
    </item>
  "
elif [[ "$all_aliases" == *$arg* ]]; then 
  for i in $folder_listing; do
    alias="${i%%:*}"
    path="${i#* }"
    echo "<item uid=\"$alias\" valid=\"no\" autocomplete=\"$alias \">
      <title>$alias</title>
      <subtitle>"$all_aliases"</subtitle>
      <icon>icons/folder.png</icon>
    </item>
  "
  done

  else
  echo "<item valid=\"no\">
      <title>No Situation Satisified</title>
      <subtitle>$arg</subtitle>
      <icon>icons/folder.png</icon>
    </item>
  "
fi
echo "</items>"
unset IFS
