#!/bin/sh

# Exit on failure
set -e

cd $REPOS/sonar
git pull
./quick-build.sh -T 1C
