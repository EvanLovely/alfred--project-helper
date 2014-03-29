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
  # @todo this creates a newline at the bottom of the file. `echo -n "$snippet"` prepends the resulting file with a literal '-n' - so weird, I don't know why.
  echo "$snippet" > "$HOME/active-project/files/snippets/$name"
fi

echo "$name Added"
