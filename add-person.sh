#!/bin/bash

# Get Name
name=`osascript -e 'set response to the text returned of (display dialog "What is the persons name?" with title "Add Person" default answer "Name")
response'`

# Get Info
info=`osascript -e 'set response to the text returned of (display dialog "What info would you like to display along with them?" with title "Add Person" default answer return & return & return & return)
response'`

# Get Email
email=`osascript -e 'set response to the text returned of (display dialog "What is their email?" with title "Add Person" default answer "Email")
response'`

# Get Photo
photo=`osascript -e 'set photo to choose file with prompt "Please select a square photo of them."

tell application "System Events"
  set item_list to POSIX path of photo
end tell'`

mkdir -p "$HOME/active-project/_files/people/$name"

if [ "$info" ]
then
  echo "$info" > "$HOME/active-project/_files/people/$name/info.txt"
fi

if [ "$email" ]
then
  echo "$email" > "$HOME/active-project/_files/people/$name/email.txt"
fi

if [ "$photo" ]
then
  cp "$photo" "$HOME/active-project/_files/people/$name/photo.jpg"
else
  cp img/default-person-photo.jpg "$HOME/active-project/_files/people/$name/photo.jpg"
fi

echo "$name Added"
