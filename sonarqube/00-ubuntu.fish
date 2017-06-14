#!/usr/local/bin/fish
# Ubuntu-only stuff. Abort if not Ubuntu.
switch (uname)
case Linux

    # Sub-folder of the SonarQube exec
    set -x SONAR_WRAPPER_FOLDER linux-x86-64

end
