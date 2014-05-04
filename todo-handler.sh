export arg="$1"
if [[ "$1" == "add"* ]]; then
  osascript -e '
    set query to do shell script "echo $arg"
    tell application "Alfred 2" to run trigger query in workflow "com.evanlovely.projecthelper"
  '
else
/opt/local/bin/terminal-notifier -message "h"
  source bash_functions
  export todos=$(getsetting todos)
  export todo="$1" # has had initial `- ` replaced with `task: `
  cleantodo=$(echo "$todo" | sed 's,task:,,' | sed "s/@.*//") # having problems with the @tag()
  cat $todos | grep -v "$cleantodo" > /tmp/todos.txt
  if [[ "$todo" == *@done* ]]; then
    # If it is already `@done` then un-do it
    echo "$todo" | sed 's,task:,-,' | sed "s/@done\(.*\)//" | sed "s/@done//" > $todos
    cat /tmp/todos.txt >> $todos
    /opt/local/bin/terminal-notifier -title "Todo unmarked as done" -subtitle "and moved to top of file" -message "${todo/-/}"
    
    else
    # add a `@done` to end of line and place it at end of file
    cat /tmp/todos.txt > $todos 
    echo "$todo @done($(date +%F))" | sed 's,task:,-,'  >> $todos
    /opt/local/bin/terminal-notifier -title "Todo marked as done" -subtitle "and moved to bottom of file" -message "${todo/-/}"
  fi

  if [[ "$(getsetting todos__show_list_after_task_action)" != "FALSE" ]]; then
    osascript -e 'tell application "Alfred 2" to run trigger "go: todo" in workflow "com.evanlovely.projecthelper"'    
  fi
fi