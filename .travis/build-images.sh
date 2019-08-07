#!/bin/sh
#
# Call this script from the root of the repository to build all images.
#

set -e

docker build -t aur-ci -f .travis/docker-image/Dockerfile .travis/docker-image
