newest_version="$(curl --silent https://raw.githubusercontent.com/EvanLovely/alfred--project-helper/master/version.txt | tr -d '\n')"
new_major=${newest_version%%.*}
new_minor=${newest_version#*.}

current_version="$(cat version.txt | tr -d '\n')"
current_major=${current_version%%.*}
current_minor=${current_version#*.}

if [[ $new_major -gt $current_major ]]; then
    echo "major update needed"
    exit
fi

if [[ $(echo $current_minor'>='$new_minor | bc -l) == 0 ]]; then
  update="$current_major.$current_minor => $new_major.$new_minor"
  /opt/local/bin/terminal-notifier -title "Time to Update" -subtitle "$update" -message "Downloading..."
  sh update.sh
else
  echo "You are up to date! ($current_major.$current_minor)"
fi
  