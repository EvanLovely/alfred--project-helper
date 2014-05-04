arg="$1"
if [[ "$arg" == */snippets/* ]]; then
  sh snippets/snippets__handler.sh "$arg"
elif [[ "$arg" == *theme-copies* ]]; then
  open "$(echo "$arg" | sed "s,^.*theme-copies,$HOME/active-project/theme__on_server,")"
elif [[ "$arg" == *module-copies* ]]; then
  open "$(echo "$arg" | sed "s,^.*module-copies,$HOME/active-project/modules__on_server,")"
else
  open "$arg"  
fi
