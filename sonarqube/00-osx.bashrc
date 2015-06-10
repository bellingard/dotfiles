#!/bin/bash
# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# Folder where third-party software is located
export SOFTWARE_FOLDER=$HOME/Software

# Sub-folder of the SonarQube exec
export SONAR_WRAPPER_FOLDER=macosx-universal-64
