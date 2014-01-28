#!/bin/bash
# Ubuntu-only stuff. Abort if not Ubuntu.
[[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1

# Folder where third-party software is located
export SOFTWARE_FOLDER=/home/fabrice/Software

# Sub-folder of the SonarQube exec
export SONAR_WRAPPER_FOLDER=linux-x86-64
