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


# ================================
# Aliases specific to GitHub repositories and associated tests
# ================================

export SOFTWARE_FOLDER=$SOFTWARE_FOLDER
export REPOS=$HOME/Repos
export TESTS=$HOME/Tests

export TESTS_BACKUP=$TESTS/BACKUP
export PLUGINS_PROD=$SOFTWARE_FOLDER/Sonar/current/extensions/plugins
export PLUGINS_DEV=$HOME/SONAR/sonar-current/extensions/plugins

export MAVEN_OPTS="-Xmx1024M -XX:MaxPermSize=256M"
export M2_HOME=$SOFTWARE_FOLDER/Maven/current
export MAVEN_LOCAL_REPOSITORY=$HOME/.m2/repository
export MAVEN_HOME=M2_HOME
export ANT_HOME=$SOFTWARE_FOLDER/Ant/apache-ant-1.8.0
export SONAR_RUNNER_HOME=$SOFTWARE_FOLDER/SonarRunner/current
export GRADLE_HOME=$SOFTWARE_FOLDER/Gradle/current
export GRADLE_OPTS="-Xmx1024M -XX:MaxPermSize=256M"
export ANDROID_HOME=$SOFTWARE_FOLDER/Android/current/sdk
export V8_HOME=$SOFTWARE_FOLDER/V8/current
export SUBVERSION_BIN=/opt/subversion/bin

export PATH=$HOME/Scripts:$M2_HOME/bin:$SONAR_RUNNER_HOME/bin:$GRADLE_HOME/bin:$V8_HOME:$SUBVERSION_BIN:/usr/local/git/bin/:$PATH


export PENV="-Dsonar.jdbc.url=jdbc:postgresql://localhost:15432/sonar -Dsonar.jdbc.driverClassName=org.postgresql.Driver -Dsonar.host.url=http://localhost:9000"
export MENV="-Dsonar.jdbc.url=jdbc:mysql://localhost:13306/sonar?autoReconnect=true&useUnicode=true&characterEncoding=utf8 -Dsonar.jdbc.driverClassName=com.mysql.jdbc.Driver -Dsonar.host.url=http://localhost:9000"
export OENV="-Dsonar.jdbc.url=jdbc:oracle:thin:@192.168.135.202/XE -Dsonar.jdbc.driverClassName=oracle.jdbc.OracleDriver -Dsonar.host.url=http://localhost:9000"
export HENV="-Dsonar.jdbc.url=jdbc:h2:tcp://localhost:9092/sonar -Dsonar.jdbc.driverClassName=org.h2.Driver -Dsonar.host.url=http://localhost:9000"
