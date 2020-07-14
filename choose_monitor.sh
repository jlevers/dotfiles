#!/bin/bash
set -e
shopt -s nullglob  # Count an empty dir as 0 files, not 1

layouts=($HOME/.screenlayout/*)
numlayouts=${layouts[@]}

if [[ $numlayouts -eq 0 ]]; then
    echo "No screen layouts available."
    exit 1
fi

echo "Monitor layouts available:"
for i in ${!layouts[@]}; do
    echo "    $i) $(basename ${layouts[$i]})"
done
echo
read -p "Choose a layout: " layout

num_re='^[0-9]+$'
if ! [[ $layout =~ $num_re ]] || [[ $layout -lt 0 || $layout -gt $i ]] ; then
    echo "Error: $layout must be a number between 0 and $i."
    exit 1
fi

echo "Activating layout $(basename ${layouts[$layout]})."
exec "${layouts[$layout]}"
