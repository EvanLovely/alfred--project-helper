newest_version=$(curl --silent https://raw.githubusercontent.com/EvanLovely/alfred--project-helper/master/version.txt)
current_version=$(cat version.txt)
echo "Newest: $newest_version"
new_major=${newest_version%%.*}
echo "New Major: $new_major"
echo "Current: $current_version"
# Doesn't work because I store the version numbers like this: 3.6.3 @todo
if [ "$newest_version" -gt "$current_version" ]; then
  echo "Time to Update"
else
  echo "You are up to date!"
fi
  