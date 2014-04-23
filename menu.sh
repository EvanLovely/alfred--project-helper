#!/bin/bash
echo "<items>"
if [[ "$1" != "go"* ]]; then

echo "<item><title>Find</title></item>"
echo "<item autocomplete='go settings' valid='no'><title>Settings</title></item>"
fi

if [[ "$1" == "go settings"* ]]; then
  echo "<item autocomplete='go 1 setting' arg='go 1 setting' valid='no'><title>Setting 1</title></item>"
  echo "<item autocomplete='go 2 setting' arg='go 2 setting' valid='no'><title>Setting 2</title></item>"
fi
if [[ "$1" == "go 1 setting"* ]]; then
  echo "<item autocomplete='settings 1a' arg='settings 1a' valid='no'><title>Setting 1b</title></item>"
  echo "<item autocomplete='settings 1b' arg='settings 1b' valid='no'><title>Setting 1b</title></item>"
    
fi    
if [[ "$1" == "go 2 setting"* ]]; then
  echo "<item autocomplete='settings 1a' arg='settings 2a' valid='no'><title>Setting 2a</title></item>"
  echo "<item autocomplete='settings 2b' arg='settings 2b' valid='no'><title>Setting 2b</title></item>"
    
fi    
echo "</items>"