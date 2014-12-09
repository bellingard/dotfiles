#!/bin/bash

# ================================
# Settings specific to tests of SonarQube
# ================================

export REPOS=$HOME/Repos
export TESTS=$HOME/Tests
export VMS_REPO=$HOME/VMs
export TESTS_BACKUP=$TESTS/BACKUP

export SONAR_TESTS=$SOFTWARE_FOLDER/Sonar/DEV_VERSION
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
export GROOVY_HOME=$SOFTWARE_FOLDER/Groovy/current

export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'
export MAVEN_OPTS='-server'
export SONAR_RUNNER_OPTS='-server'

# Add tools to the PATH
export PATH=$GROOVY_HOME/bin:$ANT_HOME/bin:$M2_HOME/bin:$SONAR_RUNNER_HOME/bin:$GRADLE_HOME/bin:$V8_HOME:$SUBVERSION_BIN:$PATH
# Add dotfiles folders
export PATH=$DOTFILES/bin-sonarqube-prod:$DOTFILES/bin-sonarqube-tests:$PATH

# Add env URLs for SQ
export P_JDBC_URL="jdbc:postgresql://localhost:15432/sonar"
export M_JDBC_URL="jdbc:mysql://localhost:13306/sonar?autoReconnect=true&useUnicode=true&characterEncoding=utf8&useConfigs=maxPerformance"
export O_JDBC_URL="jdbc:oracle:thin:@localhost:11521/ORCL"
export H_JDBC_URL="jdbc:h2:tcp://localhost:9092/sonar"
export MS_JDBC_URL="jdbc:jtds:sqlserver://localhost/sonar;SelectMethod=Cursor"

# Add env URLs for SQ
export PENV="-Dsonar.jdbc.url=$P_JDBC_URL -Dsonar.jdbc.driverClassName=org.postgresql.Driver -Dsonar.host.url=http://localhost:9000"
export MENV="-Dsonar.jdbc.url=$M_JDBC_URL -Dsonar.jdbc.driverClassName=com.mysql.jdbc.Driver -Dsonar.host.url=http://localhost:9000"
export OENV="-Dsonar.jdbc.url=$O_JDBC_URL -Dsonar.jdbc.driverClassName=oracle.jdbc.OracleDriver -Dsonar.host.url=http://localhost:9000"
export HENV="-Dsonar.jdbc.url=$H_JDBC_URL -Dsonar.jdbc.driverClassName=org.h2.Driver -Dsonar.host.url=http://localhost:9000"
export MSENV="-Dsonar.jdbc.url=$MS_JDBC_URL -Dsonar.jdbc.driverClassName=net.sourceforge.jtds.jdbc.Driver -Dsonar.host.url=http://localhost:9000"

# For Dory VM
export NO_SONARQUBE=1
