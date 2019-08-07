#!/bin/sh
#
# Call this script from the root of the repository to build all packages.
#

set -e

for pkg in $(ls -d */); do
    # Mount the whole repo and copy the package we want to build to a separate
    # directory. This avoids cluttering the base repo.
    echo "************************************************************"
    echo "** Building $pkg"
    echo "************************************************************"
    docker run \
        -it --rm \
        -v $PWD:/repo \
        aur-ci \
        -c "cp -r /repo/$pkg /tmp/build-pkg && \
            cd /tmp/build-pkg && \
            makepkg --noconfirm --syncdeps --cleanbuild --install"
done
