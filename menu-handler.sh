echo "$1" > ~/to-menu-handler.txt

if [[ "$1" == "sh"* ]]; then
      $1
  elif [[ "$1" == "/"* ]]; then

          # custom work for working around complicated project
          if [[ "$1" == *"/theme-copies/"* ]]; then
            open "$(echo "$1" | sed "s,^.*theme-copies,$HOME/active-project/theme__on_server,")"
          elif [[ "$1" == *"/module-copies/"* ]]; then
            open "$(echo "{query}" | sed "s,^.*module-copies,$HOME/active-project/modules__on_server,")"
            # end custom work
          else

      # if a link and we want them to open in the dev browser, then do
      if [[ "$1" == *".webloc" && "$(getsetting links_open_in_dev_browser)" == "TRUE" ]]; then
        open "$1" -a "$(getsetting dev_browser)"
      else
        # the majority of all passed into this script, not just links, end up here: simply being opened
        open "$1"
      fi

    fi
    # just in case it's a relative link, open it too
  elif [[ "$1" == "~"* ]]; then
    open "$1"
  else
    echo "$1"
fi
