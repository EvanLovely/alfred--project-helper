source bash_functions

# Shutdown current project
sh ~/active-project/_files/settings/shutdown.sh
rm -rf ~/active-project
mkdir ~/active-project

# Get the project name passed in and replace spaces with dashes
P=`echo "${1// /-}"`

# Just in case it's not already made
mkdir ~/all-projects

# Grab the project files template, move it in, and name it after the project
cp -r templates/project-files ~/all-projects/$P


# Sym Link the main files directory so we can access the settings.yml file inside
ln -s ~/all-projects/$P ~/active-project/_files

# Get Site Root
P_SITE_ROOT=`osascript -e 'set source_folder to choose folder with prompt "Please select the Site Root directory."

tell application "System Events"
  set item_list to POSIX path of source_folder
end tell'`
if [ "$P_SITE_ROOT" ]
then
  addfolder site_root "$P_SITE_ROOT"
fi

# Get Site Root Scripts
osascript -e 'set response to the text returned of (display dialog "What scripts do you want to run in this folder when the project starts? (i.e. git pull)" with title "Site Root Scripts" default answer return & return & return & return)
response' >> ~/active-project/_files/settings/start-in-site-root.sh

# Get Theme Root
P_THEME=`osascript -e 'set source_folder to choose folder with prompt "Please select the Theme directory."

tell application "System Events"
  set item_list to POSIX path of source_folder
end tell'`
if [ "$P_THEME" ]
then
  addfolder theme "$P_THEME"
fi

# Get Theme Scripts
osascript -e 'set response to the text returned of (display dialog "What scripts do you want to run in this folder when the project starts? (i.e. compass watch)" with title "Theme Directory Scripts" default answer return & return & return & return)
response' >> ~/active-project/_files/settings/start-in-theme.sh

# Set Shutdown Scripts
osascript -e 'set response to the text returned of (display dialog "What scripts do you want to run when you switch to another project? (i.e. killall compass)" with title "Shutdown Scripts" default answer return & return & return & return)
response' >> ~/active-project/_files/settings/shutdown.sh


# Get Google Docs directory
P_GDOCS=`osascript -e 'set source_folder to choose folder with prompt "Please select the Google Docs directory."

tell application "System Events"
  set item_list to POSIX path of source_folder
end tell'`
if [ "$P_GDOCS" ]
then
  addfolder gdocs "$P_GDOCS"
fi

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

# Get Tasks File Name
TODO_FILE=`osascript -e 'set response to the text returned of (display dialog "What do you want to call your todo file?" with title "Todos" default answer "todo.txt")
response'`
if [ "$TODO_FILE" ]
then
  addsetting todos "$TODO_FILE"
fi


sh start-project.sh
open ~/all-projects/$P
terminal-notifier -title "Project Helper" -message "$P Project Made."
