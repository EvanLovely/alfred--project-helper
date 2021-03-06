echo  "<item arg=\"$1\" type=\"file\" uid=\"$1\">"
echo "<title>${1/$dir\//}</title>"
echo "<subtitle>\c"
tags=$(/opt/local/bin/tag -Nl "$1")
if [ "$tags" ]; then
  echo "tags: $tags --- \c"
fi
if [ "$2" ]; then
  symbols=$(cat "$1" | egrep "^\S.*${2// /.*}" | sed "s/ //g" | sed "s/{/, /g")
  if [[ "$symbols" ]]; then
    echo "In file: $(echo $symbols)"
  fi
fi
echo "</subtitle>"
echo "<icon type=\"fileicon\">$1</icon></item>"
