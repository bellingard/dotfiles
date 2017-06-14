#!/usr/local/bin/fish
# OSX-only stuff. Abort if not OSX.
switch (uname)
case Darwin
    
    # Sub-folder of the SonarQube exec
    set -x SONAR_WRAPPER_FOLDER macosx-universal-64

end
