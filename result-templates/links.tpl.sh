echo  "<item arg=\"$1\" type=\"file\""
if [ "$2" == "--no-uid" ]; then
    echo ">"
    else
    echo " uid=\"$1\">"
fi
echo "<title>$(echo "${1/$dir\/}" | sed "s/.webloc//")</title>"
echo "<subtitle>$(/opt/local/bin/tag -Nl "$1") ~ <![CDATA[$(grep "string" "$1" | sed "s/<string>//" | sed "s/<\/string>//")]]></subtitle>"
echo "<icon type=\"fileicon\">$1</icon></item>"
