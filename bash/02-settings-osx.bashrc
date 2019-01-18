#!/bin/bash
# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# Use colors for "ls"
alias ls="ls -G"

# Remove all .DS_Store files from directory recursively
alias dsstore-clean='find . -type f -name .DS_Store -delete'

# Git completion
export GIT_COMPLETION_PATH=/usr/local/git/contrib/completion/git-completion.bash
export GIT_PROMPT_PATH=/usr/local/git/contrib/completion/git-prompt.sh

# JAVA_HOME folder
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

# NVM installed with Homebrew
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
export PATH=$NVM_DIR:$PATH

# AWS CLI tools installed with PIP (https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
export PATH=$HOME/Library/Python/2.7/bin/:$PATH
