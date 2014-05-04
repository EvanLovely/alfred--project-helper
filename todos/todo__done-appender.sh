done=$(cat "$1" | grep "@done")
not_done=$(cat "$1" | grep -v "@done")
echo "$not_done" > "$1"
echo "$done" >> "$1"
