#!/bin/bash
source bash_functions
task_file=$(getsetting todos)
export args="$1"
IFS=$'\n'

echo "<items>"

if [ "$args" ] 
  then
    # Filter List
    for i in $(cat $task_file | egrep -i "^-.*${args// /.*}"); do
        sh result-templates/todo.tpl.sh "$i"
    done
  else
    # List All
    echo "<item><title>Append new task with CMD+Enter. Enter on a task to complete.</title><subtitle>Prepend new task with Option+Enter. Open @url() tags with Ctrl+Enter.</subtitle></item>"
    for i in $(cat $task_file | egrep "^-"); do
        sh result-templates/todo.tpl.sh "$i"
    done
fi

echo "</items>"
unset IFS
