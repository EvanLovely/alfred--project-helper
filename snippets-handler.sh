#!/bin/bash

if [[ "$1" == ",p add snippet" ]]
  then
    osascript -e '
    tell application "Alfred 2" to search ",p add snippet" 
    tell application "System Events"
      keystroke return
    end tell'

  else
    cat "$1" | pbcopy
    cat "$1 copied"

    osascript -e 'tell application "System Events"
      keystroke "v" using {command down}
    end tell'
fi
