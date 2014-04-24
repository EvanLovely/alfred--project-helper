echo "$1" > ~/to-menu-handler.txt

if [[ "$1" == "sh"* ]]; then
      $1
  elif [[ "$1" == "/"* ]]; then
    # custom work for working around complicated project
    if [[ "$1" == *"/theme-copies/"* ]]; then
      open "$(echo "$1" | sed "s,^.*theme-copies,$HOME/active-project/theme__on_server,")"
    elif [[ "$1" == *"/module-copies/"* ]]; then
      open "$(echo "{query}" | sed "s,^.*module-copies,$HOME/active-project/modules__on_server,")"
    else
      open "$1"
    fi
  elif [[ "$1" == "~"* ]]; then
    open "$1"
  else
    echo "$1"
fi
