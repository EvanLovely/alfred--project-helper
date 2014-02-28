# Starts up a project when making a new one or switching to a previously created one. MUST have already linked the files directory so that we can access `~/active/files/settings.yml`.
source bash_functions

SITE_ROOT=`getsetting site_root`
if [ "$SITE_ROOT" ]
  then
    ln -s "$SITE_ROOT" ~/active/site-root
  fi

THEME=`getsetting theme`
if [ "$THEME" ]
  then
    ln -s "$THEME" ~/active/theme
  fi

GDOCS=`getsetting gdocs`
if [ "$GDOCS" ]
  then
    ln -s "$GDOCS" ~/active/docs
  fi

# Start scripts in theme folder
osascript -e 'tell application "Terminal"
do script "cd ~/active/theme
terminal-notifier -title \"Project Helper\" -subtitle \"Theme Scripts Started\" -message \"Click to Edit\" -execute \"open -t ~/active/files/scripts/start-in-theme.sh\"
sh ~/active/files/scripts/start-in-theme.sh"
end tell
'

# Start scripts in site root folder
osascript -e 'tell application "Terminal"
do script "cd ~/active/site-root
terminal-notifier -title \"Project Helper\" -subtitle \"Site Root Scripts Started\" -message \"Click to Edit\" -execute \"open -t ~/active/files/scripts/start-in-site-root.sh\"
sh ~/active/files/scripts/start-in-site-root.sh"
end tell
'

sh ~/active/scripts/open-at-start.sh
/opt/local/bin/terminal-notifier -title "Project Helper" -subtitle "Done opening" -message "Click to edit" -execute "open ~/active/files/scripts/open-at-start.sh"

open `getsetting dev_url` -a "`getsetting dev_browser`"
