#!/bin/bash
source bash_functions
task_file="$(getsetting todos)"
tasks=$(cat "$(getsetting todos)")
export args="$1"
IFS=$'\n'
echo "<items>"

if [ "$args" ] 
  then
    # Filter List
    for i in $(echo "$tasks" | egrep -i "${args// /.*}"); do
        sh result-templates/todo.tpl.sh "$i"
    done
  else
    # List All
    echo "<item arg=',p add todo'><title>Add new todo at bottom. (Hold CMD to add to top) </title><subtitle>Shift+Enter to open task file. Action tasks with @url with Ctrl; @tag with Option.</subtitle></item>"
    for i in $(echo "$tasks"); do
        sh result-templates/todo.tpl.sh "$i"
    done
fi

echo "</items>"
unset IFS
