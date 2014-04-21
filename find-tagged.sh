#!/bin/bash
IFS=$'\n'
tag="${1%%➢*}"
filter="${1##*➢}"
paths_to_remove="[theme|modules]-copies"
echo "<items>"

for i in $(find -x ~/active-project -follow -exec /opt/local/bin/tag -m "$tag" {} +\; | egrep -v $paths_to_remove | egrep -i "${filter// /.*}"); do
  if [[ "$i" == */snippets/* ]]; then
    sh result-templates/snippet.tpl.sh "$i"
  else
    sh result-templates/generic.tpl.sh "$i"
  fi
done

echo "</items>"

unset IFS