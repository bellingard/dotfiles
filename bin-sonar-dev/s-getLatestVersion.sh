#!/bin/sh
cd $REPOS/sonar
git pull
./quick-build.sh -T 1C
