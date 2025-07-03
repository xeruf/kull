#!/bin/sh -e
# A small utility to copy new versions of the commit-msg hooks
# into all existing projects
find .dev/githooks -type f -exec sh -c 'locate "*/{}" | grep -vE "(archive|snapshot|yadm|kull)" | xargs -p -L 1 cp -v {}' \;
