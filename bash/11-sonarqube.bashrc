#!/bin/bash

# ================================
# Settings specific to tests of SonarQube
# ================================

export REPOS=$HOME/Repos
export TESTS=$HOME/Tests
export VMS_REPO=$HOME/VMs
export TESTS_BACKUP=$TESTS/BACKUP
export SONAR_TESTS=$HOME/SONAR
export SONAR_TESTS_BACKUP=$SONAR_TESTS/BACKUP

export PLUGINS_DEV=$SONAR_TESTS/sonar-current/extensions/plugins
export PLUGINS_PROD=$SOFTWARE_FOLDER/Sonar/current/extensions/plugins

export MAVEN_OPTS="-Xmx1024M -XX:MaxPermSize=256M"
export M2_HOME=$SOFTWARE_FOLDER/Maven/current
export MAVEN_LOCAL_REPOSITORY=$HOME/.m2/repository
export MAVEN_HOME=M2_HOME
export ANT_HOME=$SOFTWARE_FOLDER/Ant/current
export SONAR_RUNNER_HOME=$SOFTWARE_FOLDER/SonarRunner/current
export GRADLE_HOME=$SOFTWARE_FOLDER/Gradle/current
export GRADLE_OPTS="-Xmx1024M -XX:MaxPermSize=256M"
export ANDROID_HOME=$SOFTWARE_FOLDER/Android/current/sdk
export V8_HOME=$SOFTWARE_FOLDER/V8/current
export SUBVERSION_BIN=/opt/subversion/bin

export PATH=$ANT_HOME/bin:$M2_HOME/bin:$SONAR_RUNNER_HOME/bin:$GRADLE_HOME/bin:$V8_HOME:$SUBVERSION_BIN:$PATH

export PATH=$DOTFILES/bin-sonarqube-prod:$DOTFILES/bin-sonarqube-tests:$PATH

export PENV="-Dsonar.jdbc.url=jdbc:postgresql://localhost:15432/sonar -Dsonar.jdbc.driverClassName=org.postgresql.Driver -Dsonar.host.url=http://localhost:9000"
export MENV="-Dsonar.jdbc.url=jdbc:mysql://localhost:13306/sonar?autoReconnect=true&useUnicode=true&characterEncoding=utf8&useConfigs=maxPerformance&useCursorFetch=true -Dsonar.jdbc.driverClassName=com.mysql.jdbc.Driver -Dsonar.host.url=http://localhost:9000"
export OENV="-Dsonar.jdbc.url=jdbc:oracle:thin:@localhost:11521/ORCL -Dsonar.jdbc.driverClassName=oracle.jdbc.OracleDriver -Dsonar.host.url=http://localhost:9000"
export HENV="-Dsonar.jdbc.url=jdbc:h2:tcp://localhost:9092/sonar -Dsonar.jdbc.driverClassName=org.h2.Driver -Dsonar.host.url=http://localhost:9000"
export MSENV="-Dsonar.jdbc.url=jdbc:jtds:sqlserver://localhost/sonar;SelectMethod=Cursor -Dsonar.jdbc.driverClassName=net.sourceforge.jtds.jdbc.Driver -Dsonar.host.url=http://localhost:9000"
