#!/bin/sh

# Wine settings for editor.
# TODO: Make this optional in case Wine is not installed.
# TODO: Use a hidden folder, but then the editor does not work.
export WINEPREFIX="$HOME/LegacyClonk/wine"
export WINEARCH=win64

wine_setup()
{
    which wine &> /dev/null
    if [ $? -ne 0 ]; then
        echo "Install wine to use the editor"
        exit 1
    fi

    if [ ! -d "$HOME/LegacyClonk/wine" ] ; then
        mkdir -p "$HOME/LegacyClonk/wine"
        wineboot -u
    fi
}

# TODO: Don't copy on every launch.
#       There will be problems if an archive was unpacked.
mkdir -p "$HOME/LegacyClonk"
cp -r /usr/share/legacyclonk/* "$HOME/LegacyClonk/"

if [[ "$#" = 0 ]]; then
    "$HOME/LegacyClonk/clonk"
elif [[ "$#" = 1 ]] && [[ "$1" = "--editor" ]]; then
    wine_setup;
    wine "$HOME/LegacyClonk/Editor.exe"
else
    echo "Invalid command line options"
    exit 1
fi
