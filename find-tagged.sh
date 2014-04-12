#!/bin/bash
IFS=$'\n'
tag="${1%%➢*}"
filter="${1##*➢}"
echo "<items>"

for i in $(find -x ~/active-project -follow -exec /opt/local/bin/tag -m "$tag" {} +\; | egrep -i "${filter// /.*}"); do
  echo "<item type=\"file\" arg=\"$i\"><title>${i##*/}</title><subtitle>$(echo "${i/$HOME/~}" | sed "s/${i##*/}//")</subtitle><icon>$i</icon></item>"
done

echo "</items>"

unset IFS