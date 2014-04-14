dir="$1"
export dirname="$(basename "$1")"
source bash_functions
name=$(osascript -e 'set dirname to do shell script "echo $dirname"
  set response to the text returned of (display dialog "This is the name of the symbolic link that will be created in ~/active-project/" with title "New Custom Folder" default answer dirname) 
response')
if [ "$name" ]; then
  replacefolder "${name// /_}" "$dir"
  ln -s "$dir" ~/active-project/${name// /_}
  echo "~/active-project/${name// /_}"
fi
