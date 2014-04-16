echo "<item arg=\"$1\"><title>$1</title>"
if [[ "$1" == *@done* ]]; then
    echo "<icon>icons/checkmark.png</icon>"
  else
    echo "<icon>icons/minus.png</icon>"
fi
echo "</item>"