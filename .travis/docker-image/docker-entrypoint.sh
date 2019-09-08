#!/bin/bash
#
# Install package dependencies and build the package.
# TODO: Maybe look for dependencies locally. This might be helpful during initial
#       package development when nothing has been submitted to the AUR.
#

set -e

if [[ $# != 1 ]]; then
    echo "Invalid number of arguments"
    exit 1
fi

MAKEPKG_FLAGS="--noconfirm --syncdeps --cleanbuild --install"

# Copy the package we want to build to a separate directory to avoid cluttering
# the base repo.
cp -r /repo/$1 /tmp/build-pkg
cd /tmp/build-pkg

# Load the PKGBUILD file
source PKGBUILD

# Install make dependencies and dependencies.
yay -S --noconfirm --asdeps ${makedepends[@]} ${depends[@]}

# Git is not a dependency by default, so we remove it and build the package.o
# Syncdeps is enabled, so it will be reinstalled if necessary.
sudo pacman --noconfirm -Rs git
makepkg $MAKEPKG_FLAGS
