#!/bin/bash
# Ubuntu-only stuff. Abort if not Ubuntu.
[[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1

# Git completion
export GIT_COMPLETION_PATH=/etc/bash_completion.d/git-prompt

# Sub-folder of the SonarQube exec
export SONAR_WRAPPER_FOLDER=linux-x86-64
