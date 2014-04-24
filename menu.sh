#!/bin/bash
echo "<items>"
if [[ "$1" != "go"* ]]; then

echo "<item><title>Find</title></item>"
echo "<item autocomplete='go settings' valid='no'><title>Settings</title></item>"
fi

if [[ "$1" == "go settings"* ]]; then
  echo "<item arg='sh new-project.sh' valid='yes' file='no'><title>Create New Project</title><subtitle>Creates a new Project that will be focus of all of these Alfred Commands.</subtitle></item>"
  echo "<item autocomplete='go switch ' arg='switch-project' valid='no' file='no'><title>Switch Projects</title></item>"
  echo "<item arg='sh check-for-update.sh' valid='yes' file='no'><title>Update Me</title></item>"
fi
if [[ "$1" == "go 1 setting"* ]]; then
  echo "<item autocomplete='settings 1a' arg='settings 1a' valid='no'><title>Setting 1b</title></item>"
  echo "<item autocomplete='settings 1b' arg='settings 1b' valid='no'><title>Setting 1b</title></item>"
    
fi    
if [[ "$1" == "go 2 setting"* ]]; then
  echo "<item autocomplete='settings 1a' arg='settings 2a' valid='no'><title>Setting 2a</title></item>"
  echo "<item autocomplete='settings 2b' arg='settings 2b' valid='no'><title>Setting 2b</title></item>"
    
fi    

if [[ "$1" == "go switch"* ]]; then
  arg="${1//go switch /}"
  sh find-project.sh "$arg"
fi


if [[ "$1" == "go"* ]]; then
  echo "<item><title>Back to beginning of menu</title></item>"
fi
echo "</items>"