echo  "<item arg=\"$1\" type=\"file\""
if [ "$2" == "--no-uid" ]; then
    echo ">"
    else
    echo " uid=\"$1\">"
fi
echo "<title>${1##*/}</title>"
echo "<subtitle>\c"
tags=$(/opt/local/bin/tag -Nl "$1")
if [ "$tags" ]; then
  echo "tags: $tags --- \c"
fi
echo "dir: <![CDATA[${1/$dir\//}]]></subtitle>"
echo "<icon type=\"fileicon\">$1</icon></item>"
