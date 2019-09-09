#!/bin/sh

if [[ "$#" = 0 ]]; then
    /usr/share/legacyclonk/clonk
elif [[ "$#" = 1 ]] && [[ "$1" = "--editor" ]]; then
    wine /usr/share/legacyclonk/Editor.exe
else
    echo "Invalid command line options"
    exit 1
fi
