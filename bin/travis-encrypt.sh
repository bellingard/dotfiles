#!/bin/sh

# Runs Travis Encrypt from its docker image

# travis-encrypt.sh toto -r bellingard/sonar-scanner-npm

docker run --rm smartcanvas/travis-cli encrypt $*
