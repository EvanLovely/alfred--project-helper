# Starts up a project when making a new one or switching to a previously created one. MUST have already linked the files directory so that we can access `~/active-project/files/settings.yml`.
source bash_functions

SITE_ROOT=`getsetting site_root`
if [ "$SITE_ROOT" ]
  then
    ln -s "$SITE_ROOT" ~/active-project/site-root
fi

THEME=`getsetting theme`
if [ "$THEME" ]
  then
    ln -s "$THEME" ~/active-project/theme
fi

GDOCS=`getsetting gdocs`
if [ "$GDOCS" ]
  then
    ln -s "$GDOCS" ~/active-project/docs
fi

# Start scripts in theme folder, if it's there
if [ -a ~/active-project/files/scripts/start-in-theme.sh ]
  then
    osascript -e 'tell application "Terminal"
    do script "cd ~/active-project/theme
    terminal-notifier -title \"Project Helper\" -subtitle \"Theme Scripts Started\" -message \"Click to Edit\" -execute \"open -t ~/active-project/files/scripts/start-in-theme.sh\"
    sh ~/active-project/files/scripts/start-in-theme.sh"
    end tell
    '
fi

# Start scripts in site root folder, if it's there
if [ -a ~/active-project/files/scripts/start-in-site-root.sh ]
  then
    osascript -e 'tell application "Terminal"
    do script "cd ~/active-project/site-root
    terminal-notifier -title \"Project Helper\" -subtitle \"Site Root Scripts Started\" -message \"Click to Edit\" -execute \"open -t ~/active-project/files/scripts/start-in-site-root.sh\"
    sh ~/active-project/files/scripts/start-in-site-root.sh"
    end tell
    '
fi

sh ~/active-project/scripts/open-at-start.sh
/opt/local/bin/terminal-notifier -title "Project Helper" -subtitle "Done opening" -message "Click to edit" -execute "open ~/active-project/files/scripts/open-at-start.sh"

open `getsetting dev_url` -a "`getsetting dev_browser`"
