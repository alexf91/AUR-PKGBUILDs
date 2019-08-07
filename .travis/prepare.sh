#!/bin/sh
#
# Call this script from the root of the repository to prepare the environment
# based on the test target.
# Usage: .travis/prepare.sh <build|version>
#

set -e

if [ "$#" -ne 1 ]; then
    echo "ERROR: Invalid number of arguments"
    exit 1
fi

if [ "$1" = "build" ]; then
    # Build the Docker image
    exec docker build -t aur-ci -f .travis/docker-image/Dockerfile .travis/docker-image

elif [ "$1" = "version" ]; then
    # Nothing to prepare
    exit 0

else
    echo "ERROR: Invalid command"
    exit 1
fi
