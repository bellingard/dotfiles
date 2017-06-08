#!/usr/local/bin/fish
# Ubuntu-only stuff. Abort if not Ubuntu.
switch (uname)
case Linux

    # JAVA_HOME folder
    set -x JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/

end
