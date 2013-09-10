#!/bin/bash

# Find definitions in a file that fit the format `Question: Answer` and then display that, and only copy the Answer
fdefonly() {
  # arguments: file to search, defintion to search for. like this: `fd notes.txt url`
  QUESTION="$2"
  # search the text of the file we're looking at ($1) and find any letters, digits, or underscore up to a colon (:) followed by a space (i.e. 'Question: '). Then search that list with what we asked.
  cat "$1" | grep "\w*:\s" | grep -i "$QUESTION.*:" > /tmp/answer.txt
  ANSWER=$(cat /tmp/answer.txt)
  if [ "$ANSWER" = "" ] 
  then
    echo "No answer found"
  else
    # Cut off the beginning (Question: ) and then copy the rest of the line(s)
    cat /tmp/answer.txt | sed "s/.*: //" | tr -d '\n'
  fi
}

# Remove all cases of a definition
rdef() {
  cat "$1" | grep -v $2: > /tmp/definition.txt
  cat /tmp/definition.txt > "$1"
}