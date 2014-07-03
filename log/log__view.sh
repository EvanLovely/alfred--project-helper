echo "<items>"
IFS=$'\n'
log="$HOME/active-project/_files/log.md"
echo "<item arg='add: log'><title>Add to log</title></item>"
for i in $(cat "$log"); do
  title="$(echo $i | sed 's, @[a-z|A-Z]*(.*,,')"
  # tags="$(echo $i | sed 's,.* @,@,')"
  tags="${i#*@}"
  if [[ "${1// /.*}" == "" ]] || [[ "$(echo $title | egrep -ci "${1// /.*}")" != "0" ]]; then
    echo "<item><title>$title</title><subtitle>@$tags</subtitle></item>"
  fi
done
unset IFS
echo "<items>"
