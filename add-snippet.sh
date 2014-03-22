#!/bin/bash

# Get Name
name=`osascript -e 'set response to the text returned of (display dialog "What do you want to call the snippet?" with title "Add Snippet" default answer "name of snippet.txt")
response'`

# Get Snippet
snippet=`osascript -e 'set response to the text returned of (display dialog "What is the snippet?" with title "Add Snippet" default answer return & return & return & return)
response'`

mkdir "$HOME/active-project/files/snippets"

if [ "$name" ] && [ "$snippet" ]
then
  echo "$snippet" > "$HOME/active-project/files/snippets/$name"
fi

echo "$name Added"
