#!/bin/bash
echo "<items>"
if [[ "$1" != " " ]]; then

echo "<item><title>Find</title></item>"
echo "<item autocomplete='settings' arg='settings'><title>Settings</title></item>"
fi

if [[ "$1" == "settings " ]]; then
  echo "<item autocomplete='settings 1' arg='settings 1'><title>    Setting 1</title></item>"
  echo "<item autocomplete='settings 2' arg='settings 2'><title>    Setting 2</title></item>"
fi
if [[ "$1" == "settings 2"* ]]; then
  echo "<item autocomplete='settings 1a' arg='settings 1a'><title>        Setting 2a</title></item>"
  echo "<item autocomplete='settings 2a' arg='settings 2a'><title>        Setting 2b</title></item>"
    
fi    
echo "</items>"