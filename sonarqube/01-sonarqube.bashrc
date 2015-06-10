#!/bin/bash

# ================================
# Settings specific to tests of SonarQube
# ================================


export TESTS=$HOME/Tests
export VMS_REPO=$HOME/VMs


export SONAR_TESTS=$SOFTWARE_FOLDER/Sonar/DEV_VERSION
export SONAR_TESTS_BACKUP=$SONAR_TESTS/BACKUP

export PLUGINS_DEV=$SONAR_TESTS/sonar-current/extensions/plugins





# Add dotfiles folders
export PATH=$DOTFILES/sonarqube:$PATH

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
