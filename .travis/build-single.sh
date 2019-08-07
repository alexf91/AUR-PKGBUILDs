#!/bin/sh
#
# Call this script from the root of the repository to build the package set in
# the BUILD_PACKAGE environment variable.
#

set -e

if [ -z "$BUILD_PACKAGE" ]; then
    echo "BUILD_PACKAGE not defined"
    exit 1
fi

# Mount the whole repo and copy the package we want to build to a separate
# directory. This avoids cluttering the base repo.
docker run \
    -it --rm \
    -v $PWD:/repo \
    aur-ci \
    -c "cp -r /repo/$BUILD_PACKAGE /tmp/build-pkg && \
        cd /tmp/build-pkg && \
        makepkg --noconfirm --syncdeps --cleanbuild --install"
