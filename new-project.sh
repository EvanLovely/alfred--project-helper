source bash_functions
sh ~/active-project/files/scripts/shutdown.sh
P=`echo "$1" | sed "s/ /-/g"`
mkdir ~/Dropbox 
mkdir ~/all-projects
cp -r templates/project-files ~/all-projects/$P-files
mv ~/all-projects/$P-files/notes.md ~/all-projects/$P-files/$P-notes.md
tags -add p-$P ~/all-projects/$P-files/$P-notes.md
tags -add p-$P ~/all-projects/$P-files
tags -add project-files ~/all-projects/$P-files
rm -rf ~/active-project
mkdir ~/active-project

# Link the main files directory so we can access the settings.yml file inside
ln -s ~/all-projects/$P-files ~/active-project/files

# Get Site Root
P_SITE_ROOT=`osascript -e 'set source_folder to choose folder with prompt "Please select the Site Root directory."

tell application "System Events"
  set item_list to POSIX path of source_folder
end tell'`
if [ "$P_SITE_ROOT" ]
then
  addsetting site_root "$P_SITE_ROOT"
fi

# Get Site Root Scripts
osascript -e 'set response to the text returned of (display dialog "What scripts do you want to run in this folder when the project starts? (i.e. git pull)" with title "Site Root Scripts" default answer return & return & return & return)
response' >> ~/active-project/files/scripts/start-in-site-root.sh

# Get Theme Root
P_THEME=`osascript -e 'set source_folder to choose folder with prompt "Please select the Theme directory."

tell application "System Events"
  set item_list to POSIX path of source_folder
end tell'`
if [ "$P_THEME" ]
then
  addsetting theme "$P_THEME"
fi

# Get Theme Scripts
osascript -e 'set response to the text returned of (display dialog "What scripts do you want to run in this folder when the project starts? (i.e. compass watch)" with title "Theme Directory Scripts" default answer return & return & return & return)
response' >> ~/active-project/files/scripts/start-in-theme.sh

# Set Shutdown Scripts
osascript -e 'set response to the text returned of (display dialog "What scripts do you want to run when you switch to another project? (i.e. killall compass)" with title "Shutdown Scripts" default answer return & return & return & return)
response' >> ~/active-project/files/scripts/shutdown.sh


# Get Google Docs directory
P_GDOCS=`osascript -e 'set source_folder to choose folder with prompt "Please select the Google Docs directory."

tell application "System Events"
  set item_list to POSIX path of source_folder
end tell'`
if [ "$P_GDOCS" ]
then
  addsetting gdocs "$P_GDOCS"
fi


# # Get Bash App
# P_BASH=`osascript -e 'set source_folder to choose file with prompt "Please select the Application you want Bash Scripts to open in (Terminal/iTerm)." default location "/Applications"

# tell application "System Events"
#   set item_list to POSIX path of source_folder
# end tell'`
# if [ "$P_BASH" ]
# then
#   addsetting bash_app "$P_BASH"
# fi

# Get Dev Browser
P_DEV_BROWSER=`osascript -e 'set source_folder to choose file with prompt "Please select the Browser you want to develop in." default location "/Applications"

tell application "System Events"
  set item_list to POSIX path of source_folder
end tell'`
if [ "$P_DEV_BROWSER" ]
then
  addsetting dev_browser "$P_DEV_BROWSER"
fi

# Get Dev URL
P_DEV_URL=`osascript -e 'set response to the text returned of (display dialog "What address do you access your development site at?" with title "Development URL" default answer "http://localhost")
response'`
if [ "$P_DEV_URL" ]
then
  addsetting dev_url "$P_DEV_URL"
fi

# Get Staging SSH
P_SSH_STAGING=`osascript -e 'set response to the text returned of (display dialog "What is your ssh command for getting into the Staging Server?" with title "Staging SSH" default answer "ssh user@server.com")
response'`
if [ "$P_SSH_STAGING" ]
then
  addsetting ssh_staging "$P_SSH_STAGING"
fi

# Get Production SSH
P_SSH_PROD=`osascript -e 'set response to the text returned of (display dialog "What is your ssh command for getting into the Production Server?" with title "Production SSH" default answer "ssh user@server.com")
response'`
if [ "$P_SSH_PROD" ]
then
  addsetting ssh_prod "$P_SSH_PROD"
fi

sh start.sh 
open ~/all-projects/$P-files
terminal-notifier -title "Project Helper" -message "$P Project Made."
