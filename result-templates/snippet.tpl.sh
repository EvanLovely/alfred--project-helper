echo  "<item arg=\"$1\" type=\"file\""
if [ "$2" == "--no-uid" ]; then
    echo ">"
    else
    echo " uid=\"$1\">"
fi
echo "<title>$(echo "${1##*/snippets/}")</title>"
echo "<subtitle>\c"
tags=$(/opt/local/bin/tag -Nl "$1")
if [ "$tags" ]; then
  echo "tags: $tags --- \c"
fi
echo "Snippet: <![CDATA[$(head -1 "$1")]]></subtitle>"
echo "<icon type=\"fileicon\">$1</icon></item>"
