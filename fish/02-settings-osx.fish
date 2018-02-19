#!/usr/local/bin/fish
# OSX-only stuff. Abort if not OSX.
switch (uname)
case Darwin
    # Use colors for "ls"
    alias ls="ls -G"

    # Remove all .DS_Store files from directory recursively
    function dsstore-clean
        find . -type f -name .DS_Store -delete
    end

    # Brew Cask
    set -x HOMEBREW_CASK_OPTS "--caskroom=/opt/homebrew-cask/Caskroom"

    # JAVA_HOME folder
    set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home

end
