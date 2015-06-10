#!/bin/bash

# ================================
# General settings
# ================================

shopt -s no_empty_cmd_completion

# Remove duplicates from history
HISTCONTROL=ignoreboth

# Size of history
HISTFILESIZE=3000

# Protection from Ctrl-D (exits from Bash)
IGNOREEOF=1

# Enhance PATH to make sure that /usr/local/bin is used before /usr/bin
export PATH=$DOTFILES/bin:$HOME/bin:/usr/local/bin:$PATH

# ================================
# General aliases
# ================================
alias ll="ls -al"
alias grep='grep --colour=auto'
alias h="history"

# ================================
# Git repositories location
# ================================
export REPOS=$HOME/Repos
alias repos="cd $REPOS"

# ================================
# Tools location and environment variables
# ================================
# Folder where third-party software is located
export SOFTWARE_FOLDER=$HOME/Software
# Java
export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'
# Maven
export M2_HOME=$SOFTWARE_FOLDER/Maven/current
export MAVEN_OPTS="-Xmx1024M -XX:MaxPermSize=256M -server"
export MAVEN_LOCAL_REPOSITORY=$HOME/.m2/repository
export MAVEN_HOME=M2_HOME
# Ant
export ANT_HOME=$SOFTWARE_FOLDER/Ant/current
# SonarQube Runner
export SONAR_RUNNER_HOME=$SOFTWARE_FOLDER/SonarRunner/current
export SONAR_RUNNER_OPTS='-server'
# Gradle
export GRADLE_HOME=$SOFTWARE_FOLDER/Gradle/current
export GRADLE_OPTS="-Xmx1024M -XX:MaxPermSize=256M"
# Android
export ANDROID_HOME=$SOFTWARE_FOLDER/Android/current/sdk
# Groovy
export GROOVY_HOME=$SOFTWARE_FOLDER/Groovy/current
# SVN
export SUBVERSION=/opt/subversion

# Add all the tools to the PATH
export PATH=$GROOVY_HOME/bin:$ANT_HOME/bin:$M2_HOME/bin:$SONAR_RUNNER_HOME/bin:$GRADLE_HOME/bin:$V8_HOME:$SUBVERSION/bin:$PATH
