#!/bin/sh

# Path setup for Clonk and Wine.
export CLONKPREFIX="$HOME/LegacyClonk"
export WINEPREFIX="$CLONKPREFIX/.wine"
export WINEARCH=win64

wine_setup()
{
    which wine &> /dev/null
    if [ $? -ne 0 ]; then
        echo "Install wine to use the editor"
        exit 1
    fi

    if [ ! -d "$WINEPREFIX" ] ; then
        mkdir -p "$WINEPREFIX"
        wineboot -u
    fi
}

# TODO: Don't copy on every launch.
#       There will be problems if an archive was unpacked.
mkdir -p "$CLONKPREFIX"
cp -r /usr/share/legacyclonk/* "$CLONKPREFIX"

if [[ "$#" = 0 ]]; then
    "$CLONKPREFIX/clonk"
elif [[ "$#" = 1 ]] && [[ "$1" = "--editor" ]]; then
    wine_setup;
    wine "$CLONKPREFIX/Editor.exe"
else
    echo "Invalid command line options"
    exit 1
fi
