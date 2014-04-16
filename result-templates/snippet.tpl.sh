echo  "<item arg=\"$1\" type=\"file\""
if [ "$2" == "--no-uid" ]; then
    echo ">"
    else
    echo " uid=\"$1\">"
fi
echo "<title>$(echo "${1/$dir\/}")</title>"
echo "<subtitle>$(/opt/local/bin/tag -Nl "$1") ~ <![CDATA[$(head -1 "$1")]]></subtitle>"
echo "<icon type=\"fileicon\">$1</icon></item>"
