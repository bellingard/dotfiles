#!/usr/bin/env bash

# Install command-line tools using Homebrew -> https://brew.sh

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade


###############################################################################
# Installing Utilities                                                        #
###############################################################################

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils


###############################################################################
# Installing soft for dev                                                     #
###############################################################################

brew install git # need config
brew install maven
brew install node
brew install yarn
brew install python


###############################################################################
# Installing apps                                                             #
###############################################################################

brew install --cask iterm2
brew install --cask bitwarden
brew install --cask rectangle
brew install --cask firefox
brew install --cask opera
brew install --cask chromium
brew install --cask zoom
brew install --cask dropbox
brew install --cask slack
brew install --cask appcleaner
brew install --cask omnidisksweeper
brew install --cask disk-inventory-x
brew install --cask betterzip
brew install --cask vlc
brew install --cask skype
brew install --cask skitch
brew install --cask sublime-text
brew install --cask gimp
brew install --cask libreoffice
brew install --cask cyberduck
brew install --cask spotify
brew install --cask vscodium
brew install --cask 1password
brew install --cask kdrive

# Remove outdated versions from the cellar.
brew cleanup
