#!/bin/sh

# Update the Brew local base of available packages and versions, to be able to know what is updatable
brew update

# Installs new version of outdated packages
brew upgrade

# Keep only linked versions
brew cleanup -s

# Brew cache cleanup for unfinished download
brew cleanup

# Brew: is there any problems left?
brew doctor
brew missing

# Update all the npm global installed binaries, like grunt, lessc
npm update -g
