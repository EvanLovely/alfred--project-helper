# Starts up a project when making a new one or switching to a previously created one. MUST have already linked the files directory so that we can access `~/active-project/files/settings/settings.yml`.
source bash_functions

# link every line in `folders.yml` to it's definition 
IFS=$'\n'
for i in $(cat ~/active-project/files/settings/folders.yml); do
  name=${i%%:*}
  path=${i#* }
  ln -s $path ~/active-project/$name
done
unset IFS

# Start scripts in theme folder, if it's there
if [ -a ~/active-project/files/settings/start-in-theme.sh ]
  then
    osascript -e 'tell application "Terminal"
    do script "cd ~/active-project/theme
    terminal-notifier -title \"Project Helper\" -subtitle \"Theme Scripts Started\" -message \"Click to Edit\" -execute \"open -t ~/active-project/files/settings/start-in-theme.sh\"
    sh ~/active-project/files/settings/start-in-theme.sh"
    end tell
    '
fi

# Start scripts in site root folder, if it's there
if [ -a ~/active-project/files/settings/start-in-site-root.sh ]
  then
    osascript -e 'tell application "Terminal"
    do script "cd ~/active-project/site_root
    terminal-notifier -title \"Project Helper\" -subtitle \"Site Root Scripts Started\" -message \"Click to Edit\" -execute \"open -t ~/active-project/files/settings/start-in-site-root.sh\"
    sh ~/active-project/files/settings/start-in-site-root.sh"
    end tell
    '
fi

sh ~/active-project/scripts/open-at-start.sh
terminal-notifier -title "Project Helper" -subtitle "Done opening" -message "Click to edit" -execute "open ~/active-project/files/settings/open-at-start.sh"

open `getsetting dev_url` -a "`getsetting dev_browser`"
