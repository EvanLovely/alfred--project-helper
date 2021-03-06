#!/bin/bash

# Find definitions in a file that fit the format `Question: Answer` and then display that, and only copy the Answer
fdefonly() {
  # arguments: file to search, defintion to search for. like this: `fd notes.txt url`
  QUESTION="$2"
  # search the text of the file we're looking at ($1) and find any letters, digits, or underscore up to a colon (:) followed by a space (i.e. 'Question: '). Then search that list with what we asked.
  cat "$1" | grep "^\w*:\s" | grep -i "$QUESTION:" > /tmp/answer.txt
  ANSWER=$(cat /tmp/answer.txt)
  if [ "$ANSWER" != "" ]; then

    # Cut off the beginning (Question: ) and then copy the rest of the line(s)
    cat /tmp/answer.txt | sed "s/.*: //" | tr -d '\n'
  fi
}

# Remove all cases of a definition
rdef() {
  # Use: `rdef file.txt definition`
  cat "$1" | egrep -v "^$2:" > /tmp/definition.txt
  cat /tmp/definition.txt > "$1"
}

getsetting() {
  fdefonly ~/active-project/_files/settings/settings.yml $1
}

addsetting() {
  echo "$1: $2" >> ~/active-project/_files/settings/settings.yml
}

replacesetting() {
  rdef ~/active-project/_files/settings/settings.yml $1
  addsetting "$1" "$2"
}

removesetting() {
  rdef ~/active-project/_files/settings/settings.yml $1
}

getfolder() {
  fdefonly ~/active-project/_files/settings/folders.yml $1
}

addfolder() {
  echo "$1: $2" >> ~/active-project/_files/settings/folders.yml
}

replacefolder() {
  rdef ~/active-project/_files/settings/folders.yml $1
  addfolder "$1" "$2"
}

removefolder() {
  rdef ~/active-project/_files/settings/folders.yml $1
}


#######################################
# Escapes XML special characters with their entities (from: https://github.com/markokaestner/bash-workflow-handler/)
#######################################
xmlEncode() {
  echo "$1" | sed -e 's/&/\&amp;/g' -e 's/>/\&gt;/g' -e 's/</\&lt;/g' -e "s/'/\&apos;/g" -e 's/"/\&quot;/g'
}
