#!/bin/sh

command -v brew >/dev/null 2>&1
if [ "$?" -ne "0" ]; then
    echo "You should probably install Homebrew first:"
    echo "  - https://github.com/mxcl/homebrew/wiki/installation"
    echo "  - or run the command taht can be found in $DOTFILES/osx/homebrew.sh"
    # and HERE is the command:
    # ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
    exit
fi

brew doctor
brew update
brew upgrade
brew cleanup

function install {
  brew ls $1 >/dev/null 2>&1
  if [ "$?" -ne "0" ]; then
    brew install "$@"
  else
    echo "$1 already installed"
  fi
}

install coreutils

install bash
install bash-completion

install colordiff
install dwdiff
install gawk

install git
install subversion

install node

install v8
