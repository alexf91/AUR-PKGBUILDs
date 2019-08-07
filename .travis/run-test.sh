#!/bin/sh
#
# Call this script from the root of the repository to run a test.
# Usage: .travis/run-command.sh <build|version> <package>
#

set -e

if [ "$#" -ne 2 ]; then
    echo "ERROR: Invalid number of arguments"
    exit 1
fi


if [ "$1" = "build" ]; then
    # Mount the whole repo and copy the package we want to build to a separate
    # directory. This avoids cluttering the base repo.
    exec docker run \
        -it --rm \
        -v $PWD:/repo \
        aur-ci \
        -c "cp -r /repo/$2 /tmp/build-pkg && \
            cd /tmp/build-pkg && \
            makepkg --noconfirm --syncdeps --cleanbuild --install"

elif [ "$1" = "version" ]; then
    # Execute the version script.
    exec .travis/version-checks/$2

else
    echo "ERROR: Invalid command"
    exit 1
fi
