source bash_functions
terminal-notifier -message "Shutting down…" -title "Project Helper"
sh ~/active-project/files/scripts/shutdown.sh
rm -rf ~/active-project
mkdir ~/active-project
ln -s "$1" ~/active-project/files
sh start-project.sh
terminal-notifier -message "Active Project Switched"
