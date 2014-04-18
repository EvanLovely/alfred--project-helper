echo  "<item arg=\"$1\" type=\"file\""
if [[ "$1" == "--no-uid" ]] || [[ "$2" == "--no-uid" ]] || [[ "$3" == "--no-uid" ]]; then
    echo ">"
    else
    echo " uid=\"$1\">"
fi
echo "<title>$(echo "${1/$dir\/}")</title>"
tags=$(/opt/local/bin/tag -Nl "$1")
echo "<subtitle>\c"
if [ "$tags" ]; then
  echo "tags: $tags --- \c"
fi
if [[ "$1" == "--show-contents" ]] || [[ "$2" == "--show-contents" ]] || [[ "$3" == "--show-contents" ]]; then
  echo "<![CDATA[$(if [[ "$(mdls -raw -name kMDItemContentTypeTree "$1")" == *plain-text* ]]; then
    egrep -in "${terms// /.*}" "$1"
    fi)]]>\c"
fi
echo "</subtitle>"
echo "<icon type=\"fileicon\">$1</icon></item>"