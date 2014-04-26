#!/bin/bash
source bash_functions
echo "<items>"

if [[ "$1" != "go"* ]]; then
  filter="$1"
  echo "<item autocomplete='go find ' valid='no'><title>Find</title></item>" | grep -i "$filter"
  echo "<item autocomplete='go ref ' valid='no'><title>Reference</title></item>" | grep -i "$filter"
  echo "<item autocomplete='go do ' valid='no'><title>Do</title></item>" | grep -i "$filter"
  echo "<item autocomplete='go set ' valid='no'><title>Settings</title></item>" | grep -i "$filter"
fi

# Find
if [[ "$1" == "go find"* ]]; then
  filter="${1/go find/}"
  # Assets
  echo "<item autocomplete='go assets ' valid='no' file='no'><title>Find Assets</title></item>" | grep -i "$filter"
  # CSS
  if [[ -a ~/active-project/theme ]]; then
    echo "<item autocomplete='go css ' valid='no' file='no'><title>Find CSS</title></item>" | grep -i "$filter"
  fi
  # Docs
  if [[ -a ~/active-project/gdocs ]]; then
  echo "<item autocomplete='go docs ' valid='no' file='no'><title>Find Google Docs</title><subtitle>Searches ~/active-project/gdocs --- Shortcut: ',p docs'</subtitle></item>" | grep -i "$filter"
  fi
fi

  # Find > Assets
  if [[ "$1" == "go assets"* ]]; then
    arg="${1//go assets /}"
    sh search-for-files.sh ~/active-project/_files/assets/ "$arg"
  fi

  # Find > CSS
  if [[ "$1" == "go css"* ]]; then
    filter="${1/go css/}"
    echo "<item autocomplete='go files-css ' valid='no' file='no'><title>Find CSS Files</title><subtitle>Searches those files for non-indented selectors as well.</subtitle></item>" | grep -i "$filter"
    if [[ "$(getsetting css_extension)" == "scss" ]]; then
      echo "<item autocomplete='go mixins-css ' valid='no' file='no'><title>Find CSS Mixins</title><subtitle>Searches theme (not Compass) for mixin declarations and inserts as an include.</subtitle></item>" | grep -i "$filter"
    fi
  fi

    # Find > CSS > Files
    if [[ "$1" == "go files-css"* ]]; then
      arg="${1//go files-css /}"
      sh find-css.sh "$arg"
    fi

    # Find > CSS > Mixins
    if [[ "$1" == "go mixins-css"* ]]; then
      arg="${1//go mixins-css /}"
      sh find-mixins.sh ~/active-project/theme/ "$arg"
    fi

    # Find > Docs
    if [[ "$1" == "go docs"* ]]; then
      arg="${1//go docs /}"
      sh search-for-files.sh ~/active-project/gdocs/ "$arg"
    fi

# Reference
if [[ "$1" == "go ref"* ]]; then
    filter="${1/go ref/}"
    echo "<item autocomplete='go links ' valid='no' file='no'><title>Links</title></item>" | grep -i "$filter"
    echo "<item autocomplete='go snippets ' valid='no' file='no'><title>Snippets</title></item>" | grep -i "$filter"
    echo "<item autocomplete='go notes ' valid='no' file='no'><title>Notes</title></item>" | grep -i "$filter"
    echo "<item autocomplete='go todos ' valid='no' file='no'><title>Todos</title></item>" | grep -i "$filter"
    echo "<item autocomplete='go people ' valid='no' file='no'><title>People</title></item>" | grep -i "$filter"
fi
  
  # Reference > Links
  if [[ "$1" == "go links"* ]]; then
      arg="${1//go links /}"
      sh find-links.sh "$args"
  fi

  # Reference > Snippets
  if [[ "$1" == "go snippets"* ]]; then
      arg="${1//go snippets /}"
      sh find-snippets.sh ~/active-project/_files/snippets/ "$args"
  fi

# Do
if [[ "$1" == "go do"* ]]; then
    arg="${1//go do /}"
    sh scripts.sh "$arg"
fi

# if [[ "$1" != "go"* ]]; then
#     # next to-do
# fi

# Settings
if [[ "$1" == "go set"* ]]; then
  filter="${1/go set/}"
  echo "<item arg='sh new-project.sh' valid='yes' file='no'><title>Create New Project</title><subtitle>Creates a new Project that will be focus of all of these Alfred Commands.</subtitle></item>" | egrep -i "$filter"
  echo "<item autocomplete='go switch ' arg='switch-project' valid='no' file='no'><title>Switch Projects</title></item>" | egrep -i "$filter"
  echo "<item arg='sh check-for-update.sh' valid='yes' file='no'><title>Update Me</title></item>" | egrep -i "$filter"
fi
  
  # Settings > Switch Project
  if [[ "$1" == "go switch"* ]]; then
    arg="${1//go switch /}"
    sh find-project.sh "$arg"
  fi



# Anyplace but first layer; appears at bottom so you can go back to beginning. 
# @todo Add ability to go back one level, not just all the way back
if [[ "$1" == "go"* ]]; then
  echo "<item autocomplete='' valid='no'><title>Back to beginning of menu</title></item>"
fi
echo "</items>"