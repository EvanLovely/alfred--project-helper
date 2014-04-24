#!/bin/bash
echo "<items>"

if [[ "$1" != "go"* ]]; then
echo "<item autocomplete='go find ' valid='no'><title>Find</title></item>"
echo "<item autocomplete='go ref ' valid='no'><title>Reference</title></item>"
echo "<item autocomplete='go do ' valid='no'><title>Do</title></item>"
echo "<item autocomplete='go set ' valid='no'><title>Settings</title></item>"
fi

if [[ "$1" == "go find"* ]]; then
  echo "<item autocomplete='go assets ' valid='no' file='no'><title>Assets</title></item>"
  echo "<item autocomplete='go css ' valid='no' file='no'><title>CSS</title></item>"
fi

  if [[ "$1" == "go assets"* ]]; then
    arg="${1//go assets /}"
    sh search-for-files.sh ~/active-project/_files/assets/ "$arg"
  fi

  if [[ "$1" == "go css"* ]]; then
    arg="${1//go css /}"
    sh find-css.sh "$arg"
  fi

if [[ "$1" == "go ref"* ]]; then
    echo "<item autocomplete='go links ' valid='no' file='no'><title>Links</title></item>"
    echo "<item autocomplete='go snippets ' valid='no' file='no'><title>Snippets</title></item>"
    echo "<item autocomplete='go notes ' valid='no' file='no'><title>Notes</title></item>"
    echo "<item autocomplete='go todos ' valid='no' file='no'><title>Todos</title></item>"
    echo "<item autocomplete='go people ' valid='no' file='no'><title>People</title></item>"
fi

  if [[ "$1" == "go links"* ]]; then
      arg="${1//go links /}"
      sh find-links.sh "$args"
  fi

  if [[ "$1" == "go snippets"* ]]; then
      arg="${1//go snippets /}"
      sh find-snippets.sh ~/active-project/_files/snippets/ "$args"
  fi

if [[ "$1" == "go do"* ]]; then
    arg="${1//go do /}"
    sh scripts.sh "$arg"
fi

# if [[ "$1" != "go"* ]]; then
#     # next to-do
# fi

if [[ "$1" == "go set"* ]]; then
  echo "<item arg='sh new-project.sh' valid='yes' file='no'><title>Create New Project</title><subtitle>Creates a new Project that will be focus of all of these Alfred Commands.</subtitle></item>"
  echo "<item autocomplete='go switch ' arg='switch-project' valid='no' file='no'><title>Switch Projects</title></item>"
  echo "<item arg='sh check-for-update.sh' valid='yes' file='no'><title>Update Me</title></item>"
fi

  if [[ "$1" == "go switch"* ]]; then
    arg="${1//go switch /}"
    sh find-project.sh "$arg"
  fi




if [[ "$1" == "go"* ]]; then
  echo "<item autocomplete='' valid='no'><title>Back to beginning of menu</title></item>"
fi
echo "</items>"