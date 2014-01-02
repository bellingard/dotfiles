#!/bin/bash
# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.7.0u.jdk/Contents/Home
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.8.0.jdk/Contents/Home/
