source bash_functions
export value="${1%%:*}"
export setting="${1#*: }"
newsetting=$(osascript -e '
set value to do shell script "echo $value"
set setting to do shell script "echo $setting"
set response to the text returned of (display dialog value with title "Update Setting" default answer setting) 
response')
if [[ "$newsetting" != "" ]]; then 
  replacesetting "$value" "$newsetting"
  echo "$value : $newsetting"
fi
