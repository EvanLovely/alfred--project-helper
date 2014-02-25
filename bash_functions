#!/bin/bash

# Find definitions in a file that fit the format `Question: Answer` and then display that, and only copy the Answer
fdefonly() {
  # arguments: file to search, defintion to search for. like this: `fd notes.txt url`
  QUESTION="$2"
  # search the text of the file we're looking at ($1) and find any letters, digits, or underscore up to a colon (:) followed by a space (i.e. 'Question: '). Then search that list with what we asked.
  cat "$1" | grep "\w*:\s" | grep -i "$QUESTION.*:" > /tmp/answer.txt
  ANSWER=$(cat /tmp/answer.txt)
  if [ "$ANSWER" = "" ] 
  then
    echo "No answer found"
  else
    # Cut off the beginning (Question: ) and then copy the rest of the line(s)
    cat /tmp/answer.txt | sed "s/.*: //" | tr -d '\n'
  fi
}

# Remove all cases of a definition
rdef() {
  # Use: `rdef file.txt definition`
  cat "$1" | grep -v $2: > /tmp/definition.txt
  cat /tmp/definition.txt > "$1"
}

getsetting() {
  fdefonly ~/active/files/settings.yml $1
}

addsetting() {
  echo "$1: $2" >> ~/active/files/settings.yml
}

replacesetting() {
  rdef ~/active/files/settings.yml $1
  addsetting $1 $2
}

removesetting() {
  rdef ~/active/files/settings.yml $1
}

# Adds/List Mavericks Tags via Native Utilities. Source: http://apple.stackexchange.com/a/119370
tags() {
    # tags system explained: http://arstechnica.com/apple/2013/10/os-x-10-9/9/
    local src=$1
    local action="get"

    if [[ $src == "-add" ]]; then
        src=$3
        local newtag=$2
        local action="add"
    fi

    # hex -> bin -> json -> lines
    local hexToLines="xxd -r -p - - | plutil -convert json -o - - | sed 's/[][]//g' | tr ',' '\n'"

    # lines -> json -> bin -> hex
    local linesToHex="tr '\n' ',' | echo [\$(sed 's/,$//')] | plutil -convert binary1 -o - - | xxd -p - -"

    local gettags="xattr -px com.apple.metadata:_kMDItemUserTags \"$src\" 2> /dev/null | $hexToLines | sed 's/.*Property List error.*//'"

    if [[ $action == "get" ]]; then
        sh -c "$gettags"
    else
        local add="(cat -; echo \\\"$newtag\\\") | sort -u"
        local write="xattr -wx com.apple.metadata:_kMDItemUserTags \"\$($gettags | $add | grep . | $linesToHex)\" \"$src\""

        sh -c "$write"
    fi
}
export -f tags