asset=$(osascript -e 'tell me to activate
  set source_folder to choose file with prompt "Please select the file to move into the Project Assets folder."
tell application "System Events"
  set item_list to POSIX path of source_folder
end tell')

if [[ "$asset" != "" ]]; then  
  mv "$asset" ~/active-project/_files/assets
  /opt/local/bin/terminal-notifier -title "Asset Added" -message "$(basename $asset) moved to ~/active-project/_files/assets/" -execute "open ~/active-project/_files/assets"
fi
