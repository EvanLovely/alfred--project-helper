# Adds all files and commits them with a message
cd ~/active-project/site_root
git add . --all
message=$(osascript -e 'set response to the text returned of (display dialog "Commit Message" with title "Git Add and Commit" default answer " ") 
response')
git commit -m "$message"
