# mixin="${1/@mixin }"
echo "@include "$1";" | pbcopy
echo "@include "$1";"

osascript -e 'tell application "System Events"
  keystroke "v" using {command down}
end tell'
