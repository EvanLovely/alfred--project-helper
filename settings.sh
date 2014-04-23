#!/bin/bash
echo "<?xml version='1.0'?>"
args="$1"
IFS=$'\n'
folder_listing=$(cat ~/active-project/_files/settings/settings.yml | egrep -i "${args// /.*}")
echo "<items>"
# if [[ "$args" != " "  ]]; then 
  for i in $setting_listing; do
    alias="${i%%:*}"
    path="${i#* }"
    echo "<item uid=\"$alias\" valid=\"no\" autocomplete=\"$alias \">
      <title>$alias</title>
      <subtitle>$path</subtitle>
      <icon>icons/settings.png</icon>
    </item>
  "
  done
# fi
echo "</items>"
unset IFS
