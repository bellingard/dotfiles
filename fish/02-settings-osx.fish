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

    # JAVA_HOME folder
    set -x JAVA_HOME /usr/local/Cellar/openjdk/16.0.1/

    # AWS CLI tools installed with PIP (https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
    set -x PATH $HOME/Library/Python/2.7/bin/ $PATH

end
