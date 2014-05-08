echo "<items>"
echo "<item arg=\"$1\" file='no' valid='yes'><title>Type your commit message and hit Cmd+Enter.</title><subtitle>All files below will be added.</subtitle><icon>icons/plus.png</icon></item>"
status="$(cd ~/active-project/site_root/ && git status -s --porcelain)"
IFS=$'\n'
for i in $status; do
  echo "<item><title>$i</title><icon>icons/page.png</icon></item>"
done
unset IFS
echo "</items>"