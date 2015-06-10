#!/bin/bash

# ================================
# General settings
# ================================

shopt -s no_empty_cmd_completion

# Remove duplicates from history
HISTCONTROL=ignoreboth

# Size of history
HISTFILESIZE=3000

# Protection from Ctrl-D (exits from Bash)
IGNOREEOF=1

# Enhance PATH to make sure that /usr/local/bin is used before /usr/bin
export PATH=$DOTFILES/bin:$HOME/bin:/usr/local/bin:$PATH

# ================================
# General aliases
# ================================
alias ll="ls -al"
alias grep='grep --colour=auto'
alias h="history"

# ================================
# Git repositories location
# ================================
export REPOS=$HOME/Repos
alias repos="cd $REPOS"
