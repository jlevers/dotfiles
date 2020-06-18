#!/bin/bash
set -e 

if [[ ! -f "$(pwd)/files.map" ]]; then
    echo "linker.sh must be run from the dotfiles repository root."
    exit 1
fi

mapfile="$(pwd)/files.map"
while IFS=':' read -r -u3 src dest
do
    echo -n "Link $src to $dest? [Y/n] "
    read link

    if [[ $link == "Y"* ]] || [[ $link == "y"* ]]; then
        ln -s -f "$(pwd)/$src" "${dest/\~/$HOME}"
    else
        echo "Skipping $src..."
    fi
done 3< $mapfile

echo "Done."
