#!/bin/bash
# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# Sub-folder of the SonarQube exec
export SONAR_WRAPPER_FOLDER=macosx-universal-64
