source bash_functions
/opt/local/bin/terminal-notifier -message "Shutting down…" -title "Project Helper"
sh ~/active-project/files/scripts/shutdown.sh
rm -rf ~/active-project
mkdir ~/active-project
ln -s "$1" ~/active-project/files
sh start.sh
/opt/local/bin/terminal-notifier -message "Active Project Switched"