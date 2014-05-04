#!/bin/bash

if [[ "$1" == "add: snippet" ]]
  then
    osascript -e 'tell application "Alfred 2" to run trigger "add: snippet" in workflow "com.evanlovely.projecthelper"'
  else
    cat "$1" | pbcopy
    cat "$1 copied"

    osascript -e 'tell application "System Events"
      keystroke "v" using {command down}
    end tell'
fi
