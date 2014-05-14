source bash_functions
echo "<items>"
echo "<item arg=\"$1\" file='no' valid='yes'><title>Type your commit message and hit Cmd+Enter.</title>"
if [[ "$(getsetting git_push_after_commit)" == "TRUE" ]]; then
  echo "<subtitle>All files below will be added and pushed (change in settings). </subtitle><icon>icons/plus.png</icon></item>"
else
  echo "<subtitle>All files below will be added and *not* pushed (change in settings). </subtitle><icon>icons/plus.png</icon></item>"
fi
status="$(cd ~/active-project/site_root/ && git status -s --porcelain)"
IFS=$'\n'
for i in $status; do
  echo "<item><title>$i</title><icon>icons/page.png</icon></item>"
done
unset IFS
echo "</items>"