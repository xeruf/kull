#!/bin/sh -e
# A small utility to copy new versions of the commit-msg hook into all existing projects
find .dev/githooks -type f -exec sh -c 'locate "*/{}" | xargs -p -L 1 cp -v {}' \;
