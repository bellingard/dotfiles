#!/bin/bash

# Add bin folder to PATH
export PATH=$DOTFILES/sonarqube/bin:$PATH

# ================================
# Settings specific to tests of SonarQube
# ================================

export TESTS=$HOME/Tests
export VMS_REPO=$HOME/VMs

export SONAR_TESTS=$SOFTWARE_FOLDER/SonarQube/NEXT_VERSION
alias s-dev-folder="cd $SONAR_TESTS/sonar-current"
export PLUGINS_DEV=$SONAR_TESTS/sonar-current/extensions/plugins

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


# ================================
# Aliases specific to GitHub repositories and associated tests
# ================================

alias examples="cd $REPOS/sonar-examples"
alias java-projects="cd $TESTS/Java/projects"
alias fake-project="cd $TESTS/Java/projects/fake-project-for-tests"


# ================================
# Aliases to our test VMs
# ================================
alias dory-vm="cd $VMS_REPO/instances/dory-latest"
alias nemo-vm="cd $VMS_REPO/instances/nemodb-latest"
alias mysql-vm="cd $VMS_REPO/instances/mysql-5.6"
alias pg-vm="cd $VMS_REPO/instances/postgresql-9.3"
alias oracle-vm="cd $VMS_REPO/instances/oracle-11g"
alias mssql-vm="cd $VMS_REPO/instances/mssql2012"
alias ie9-vm="cd $VMS_REPO/instances/ie9-win7"
alias ie10-vm="cd $VMS_REPO/instances/ie10-win7"
alias ie11-vm="cd $VMS_REPO/instances/ie11-win7"

