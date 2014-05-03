source bash_functions
arg="$1"
task="$(echo ${arg%%@*} | sed "s/^[-|+] //")"
meta="${arg#*@}"
if [[ "$arg" == *":" ]]; then
  # Project:
  echo "<item valid=\"no\"><title>Project: $task</title>"
  echo "<icon>icons/todo-project.png</icon>"
  echo "<subtitle>--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</subtitle>"
elif [[ "$(echo $arg | sed "s,^-.*,,")" != "" ]]; then
    # notes
  echo "<item arg=\"$arg\"><title>Note</title>"
  echo "<icon>icons/edit.png</icon>"
  echo "<subtitle><![CDATA[$arg]]></subtitle>"
elif [[ "$arg" == *"- "* ]]; then
  # tasks
  echo "<item arg=\"$(xmlEncode "$(echo $arg | sed "s,^-,task:,")")\"><title><![CDATA[$arg]]></title>"
    if [[ "$arg" == *@done* ]]; then
        echo "<icon>icons/checkmark.png</icon>"
      else
        echo "<icon>icons/minus.png</icon>"
    fi
    if [[ "$arg" == *@* ]]; then
      echo "<subtitle>@$meta</subtitle>"
    fi
else
  # anything else missed
  echo "<item arg=\"$arg\"><title>Missed: <![CDATA[$arg]]></title>"
fi
echo "</item>"