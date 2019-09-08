#!/bin/bash

set -e

# Copy the package we want to build to a separate directory to avoid cluttering
# the base repo.
cp -r /repo/$1 /tmp/build-pkg
cd /tmp/build-pkg
makepkg --noconfirm --syncdeps --cleanbuild --install
