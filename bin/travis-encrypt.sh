#!/bin/sh

# Runs Travis Encrypt from its docker image

# travis-encrypt.sh toto -r bellingard/sonar-scanner-npm

docker run --rm --label=travis-cli smartcanvas/travis-cli travis encrypt $*
