#!/bin/bash
# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# Git completion
export GIT_COMPLETION_PATH=/usr/local/git/contrib/completion/git-completion.bash

# Sub-folder of the SonarQube exec
export SONAR_WRAPPER_FOLDER=macosx-universal-64
