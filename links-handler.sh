#!/bin/bash

if [ $1 = add-link ]
  then
    osascript -e '
    tell application "Alfred 2" to search ",p add link" 
    tell application "System Events"
      keystroke return
    end tell'

  else
    open "$1"
fi
