#!/usr/local/bin/fish

# ================================
# General aliases
# ================================
alias ll="ls -al"
alias grep='grep --colour=auto'
alias h="history"

# ================================
# General settings
# ================================

# Enhance PATH to make sure that /usr/local/bin is used before /usr/bin
set -x PATH $DOTFILES/bin /usr/local/bin $PATH

# ================================
# Git repositories location
# ================================
set -x REPOS $HOME/Repos
function repos
    cd $REPOS
end

# ================================
# Tools location and environment variables
# ================================
# Folder where third-party software is located
set -x SOFTWARE_FOLDER $HOME/Software
# Java
set -x JAVA_TOOL_OPTIONS '-Djava.awt.headless=true'
# Maven
set -x M2_HOME $SOFTWARE_FOLDER/Maven/current
set -x MAVEN_OPTS "-Xmx1024M -server"
set -x MAVEN_LOCAL_REPOSITORY $HOME/.m2/repository
set -x MAVEN_HOME M2_HOME
# SonarQube Scanner
set -x SONAR_SCANNER_OPTS '-server'
# Gradle
set -x GRADLE_HOME $SOFTWARE_FOLDER/Gradle/current
set -x GRADLE_OPTS "-Xmx1024M"

# Add all the tools to the PATH
set -x PATH $M2_HOME/bin $GRADLE_HOME/bin $PATH
