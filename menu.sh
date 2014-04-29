#!/bin/bash
source bash_functions
echo "<items>"

if [[ "$1" != "go"* ]]; then
  filter="$1"
  # Find
  echo "<item autocomplete='go find ' valid='no' file='no'><title>Find</title><subtitle>Find Assets, CSS, and Shared Docs</subtitle><icon>icons/search.png</icon></item>" | grep -i "$filter"
  # Reference
  echo "<item autocomplete='go ref ' valid='no' file='no'><title>Reference</title><subtitle>Open Links, Insert Snippets, Search Notes, Work with Todos, and List People on this project.</subtitle><icon>icons/book.png</icon></item>" | grep -i "$filter"
  # Go to Folder
  echo "<item arg=',p go' valid='yes' file='no'><title>Go to Folder</title><subtitle>Go to ~/active-project/ where you can jump to any project folder.</subtitle><icon>icons/folder.png</icon></item>" | grep -i "$filter"
  # Do
  echo "<item autocomplete='go do ' valid='no' file='no'><title>Do</title><subtitle>Fire off actions such as git and drush commands, and any other custom script.</subtitle><icon>icons/process.png</icon></item>" | grep -i "$filter"
  # Tags
  echo "<item arg=',p tags ' valid='yes' file='no'><title>Tags</title><subtitle>List all tags on any file in this project, then search by that tag.</subtitle><icon>icons/tag.png</icon></item>" | grep -i "$filter"
  # Next Todo
  next="$(egrep -v \"@done\" $(getsetting todos) | head -1)"
  if [[ "$next" != "" ]]; then
    echo "<item arg=',p todo'><title>Next Todo: "$next"</title><subtitle>Action to see todo list.</subtitle><icon>icons/checkmark.png</icon></item>" | grep -i "$filter"
    if [[ "$next" == *"@tag"* ]]; then
      # Supporting Material
      tag=$(echo "$next" | sed "s,^.*@tag(,," | sed "s,).*,,")
      echo "<item arg=',p tagged $tag➢'><title>List Supporting Material for Above Todo</title><subtitle>Action to open materials tagged with "$tag"</subtitle><icon>icons/pages.png</icon></item>" | grep -i "$filter"
    fi
  fi
  # Settings
  echo "<item autocomplete='go set ' valid='no' file='no'><title>Settings</title><subtitle>Change or Create Project. Change Settings for this project ($(ls -l ~/active-project/ | grep "_files ->" | sed 's,^.*/,,'))</subtitle><icon>icons/settings.png</icon></item>" | grep -i "$filter"
fi

# Find
if [[ "$1" == "go find"* ]]; then
  filter="${1/go find/}"
  # Assets
  echo "<item autocomplete='go assets ' valid='no' file='no'><title>Find Assets</title><subtitle>Searches ~/active-project/_files/assets/ --- Shortcut: ',p assets'</subtitle><icon>icons/pages.png</icon></item>" | grep -i "$filter"
  # CSS
  if [[ -a ~/active-project/theme ]]; then
    echo "<item autocomplete='go css ' valid='no' file='no'><title>Find CSS</title><subtitle>Searches ~/active-project/theme/ for styles.</subtitle><icon>icons/folder.png</icon></item>" | grep -i "$filter"
  fi
  # Docs
  if [[ -a ~/active-project/gdocs ]]; then
  echo "<item autocomplete='go docs ' valid='no' file='no'><title>Find Google Docs</title><subtitle>Searches ~/active-project/gdocs/ --- Shortcut: ',p docs'</subtitle><icon>icons/users.png</icon></item>" | grep -i "$filter"
  fi
fi

  # Find > Assets
  if [[ "$1" == "go assets"* ]]; then
    arg="${1//go assets /}"
    sh assets--find.sh ~/active-project/_files/assets/ "$arg"
  fi

  # Find > CSS
  if [[ "$1" == "go css"* ]]; then
    filter="${1/go css/}"
    echo "<item autocomplete='go files-css ' valid='no' file='no'><title>Find CSS Files</title><subtitle>Searches those files for non-indented selectors as well.</subtitle><icon>icons/pages.png</icon></item>" | grep -i "$filter"
    if [[ "$(getsetting css_extension)" == "scss" ]]; then
      echo "<item autocomplete='go mixins-css ' valid='no' file='no'><title>Find CSS Mixins</title><subtitle>Searches theme (not Compass) for mixin declarations and inserts as an include.</subtitle><icon>icons/email.png</icon></item>" | grep -i "$filter"
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
      sh docs--find.sh ~/active-project/gdocs/ "$arg"
    fi

# Reference
if [[ "$1" == "go ref"* ]]; then
    filter="${1/go ref /}"
    echo "<item autocomplete='go links ' valid='no' file='no'><title>Links</title><subtitle>Seach for URLs to open --- Shortcut: ',p links'</subtitle><icon>icons/link.png</icon></item>" | grep -i "$filter"
    echo "<item autocomplete='go snippets ' valid='no' file='no'><title>Snippets</title><subtitle>Search for chunks of text to copy and insert --- Shortcut: ',p snippets'</subtitle><icon>icons/scissor.png</icon></item>" | grep -i "$filter"
    echo "<item autocomplete='go notes ' valid='no' file='no'><title>Notes</title><subtitle>Searches ~/active-project/_files/notes --- Shortcut: ',p notes'</subtitle><icon>icons/edit.png</icon></item>" | grep -i "$filter"
    echo "<item arg=',p todo ' valid='yes' file='no'><title>Todos</title><subtitle>List actions in the TaskPaper format kept at ~/active-project/_files/$(basename $(getsetting todos)) --- Shortcut: ',p todo'</subtitle><icon>icons/checkmark.png</icon></item>" | grep -i "$filter"
    echo "<item arg=',p people ' valid='yes' file='no'><title>People</title><subtitle>Search for People on this Project --- Shortcut: ',p people'</subtitle><icon>icons/users.png</icon></item>" | grep -i "$filter"
fi
  
  # Reference > Links
  if [[ "$1" == "go links"* ]]; then
      arg="${1/go links /}"
      sh find-links.sh "$arg"
  fi

  # Reference > Snippets
  if [[ "$1" == "go snippets"* ]]; then
      arg="${1/go snippets /}"
      sh find-snippets.sh ~/active-project/_files/snippets/ "$arg"
  fi

  # Reference > Notes
  if [[ "$1" == "go notes"* ]]; then
      arg="${1/go notes /}"
      sh notes.sh ~/active-project/_files/notes "$arg"
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
  # New Project
  echo "<item arg='sh new-project.sh' valid='yes' file='no'><title>Create New Project</title><subtitle>Creates a new Project that will be focus of all of these Alfred Commands.</subtitle><icon>icons/plus.png</icon></item>" | egrep -i "$filter"
  # Switch Project
  echo "<item autocomplete='go switch ' arg='switch-project' valid='no' file='no'><title>Switch Projects</title><subtitle>Point all commands that this Alfred Workflow does to a new project.</subtitle><icon>icons/refresh.png</icon></item>" | egrep -i "$filter"
  # Project Settings
  echo "<item autocomplete='go proj set ' arg='project-settings' valid='no' file='no'><title>Project Settings for \"$(ls -l ~/active-project/ | grep "_files ->" | sed 's,^.*/,,')\"</title><subtitle>See and change subtle settings for this specific project.</subtitle><icon>icons/settings.png</icon></item>" | egrep -i "$filter"
  # Check for Updates
  echo "<item arg='sh check-for-update.sh' valid='yes' file='no'><title>Update Me</title><subtitle>Check for updates to this Alfred Workflow.</subtitle><icon>icons/down_arrow.png</icon></item>" | egrep -i "$filter"
fi
  
  # Settings > Switch Project
  if [[ "$1" == "go switch"* ]]; then
    arg="${1//go switch /}"
    sh find-project.sh "$arg"
  fi

  # Settings > Project Settings
  if [[ "$1" == "go proj set "* ]]; then
    IFS=$'\n'
    for i in $(cat ~/active-project/_files/settings/settings.yml); do
      value="${i%%:*}"
      setting="${i#*: }"
      echo "<item arg='sh setting-replace.sh \"$i\"'><title>$value</title><subtitle>$setting</subtitle></item>"
    done
    unset IFS
  fi

# Anyplace but first layer; appears at bottom so you can go back to beginning. 
# @todo Add ability to go back one level, not just all the way back
if [[ "$1" == "go"* ]]; then
  echo "<item autocomplete='' valid='no'><title>Back to beginning of menu</title><icon>icons/home.png</icon></item>"
fi
echo "</items>"