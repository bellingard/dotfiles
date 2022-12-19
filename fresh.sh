#!/bin/sh

# Before starting, the "dotfiles" repo must cloned in "$HOME/Repos"

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/Repos/dotfiles/zsh/.zshrc.symlink $HOME/.zshrc

# Same for the Git config files
rm -rf $HOME/.gitconfig
ln -s $HOME/Repos/dotfiles/git/.gitconfig.symlink $HOME/.gitconfig
rm -rf $HOME/.gitignore
ln -s $HOME/Repos/dotfiles/git/.gitignore.symlink $HOME/.gitignore

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file $HOME/Repos/dotfiles/brew/Brewfile
brew cleanup

# Set macOS preferences - we will run this last because this will reload the shell
source $HOME/Repos/dotfiles/osx/set-defaults.sh
