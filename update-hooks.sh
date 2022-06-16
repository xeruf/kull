#!/bin/sh -e
# A small utility to copy new versions of the commit-msg hook into all existing projects
locate -b "\commit-msg" | xargs -L 1 cp -v .dev/githooks/commit-msg
