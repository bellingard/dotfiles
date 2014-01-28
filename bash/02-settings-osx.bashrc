#!/bin/bash
# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# Use colors for "ls"
alias ls="ls -G"

# Remove all .DS_Store files from directory recursively
alias dsstore-clean='find . -type f -name .DS_Store -delete'

# Git completion
export GIT_COMPLETION_PATH=/usr/local/git/contrib/completion/git-completion.bash

# JAVA_HOME folder
export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.7.0u.jdk/Contents/Home
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.8.0.jdk/Contents/Home
