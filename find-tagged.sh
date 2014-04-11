#!/bin/bash

echo "<items>"

mdfind -0 "tag:$1" | xargs -0 -I {} \
  sh -c 'echo "<item arg=\"$1\" type=\"file\" uid=\"$1\"><title>${1##*/}</title><subtitle>${1/$HOME/~}</subtitle><icon type=\"fileicon\">$1</icon></item>"' -- {}

echo "</items>"
