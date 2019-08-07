"""Common functions that make version checking easier."""

import os


def get_current_version(package):
    """Get the current version of a package."""

    with open(os.path.join(package, ".SRCINFO")) as fp:
        lines = [line.strip() for line in fp.readlines()]

    current = None
    for line in lines:
        try:
            key, value = line.split("=")
        except ValueError:
            continue

        key = key.strip()
        value = value.strip()

        if key == "pkgver":
            current = value

    return current
