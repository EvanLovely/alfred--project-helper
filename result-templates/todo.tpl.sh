arg="$1"
task="$(echo ${arg%%@*} | sed "s/^- //")"
meta="${arg#*@}"
echo "<item arg=\"$arg\"><title><![CDATA[$task]]></title>"
if [[ "$arg" == *@* ]]; then
  echo "<subtitle>@$meta</subtitle>"
fi
if [[ "$arg" == *@done* ]]; then
    echo "<icon>icons/checkmark.png</icon>"
  else
    echo "<icon>icons/minus.png</icon>"
fi
echo "</item>"