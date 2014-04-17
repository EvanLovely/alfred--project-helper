arg="$1"
if [[ "$arg" == */snippets/* ]]; then
  sh snippets-handler.sh "$arg"
else
  open "$arg"  
fi
