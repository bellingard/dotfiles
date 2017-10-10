#!/usr/local/bin/fish

# Add bin folder to PATH
set -x PATH $DOTFILES/sonarqube/bin $PATH

# ================================
# Settings specific to test snapshot version of SonarQube
# ================================
set -x SONAR_CURRENT $SOFTWARE_FOLDER/SonarQube/current


# ================================
# Settings specific to test snapshot version of SonarQube
# ================================
set -x SONAR_NEXT_FILES $SOFTWARE_FOLDER/SonarQube/NEXT_VERSION_FILES
set -x SONAR_NEXT $SOFTWARE_FOLDER/SonarQube/sonarqube-next
set -x PLUGINS_DEV $SONAR_NEXT/extensions/plugins
function s-next
    cd $SONAR_NEXT
end


# ================================
# Env variables used for the different DB
# ================================
# Add env URLs for SQ
set -x P_JDBC_URL "jdbc:postgresql://localhost:5432/sonarqube"
set -x M_JDBC_URL "jdbc:mysql://localhost:3306/sonarqube?autoReconnect=true&useUnicode=true&characterEncoding=utf8&useConfigs=maxPerformance"
set -x O_JDBC_URL "jdbc:oracle:thin:@localhost:1521/ORCL"
set -x H_JDBC_URL "jdbc:h2:tcp://localhost:9092/sonar"
set -x MS_JDBC_URL "jdbc:jtds:sqlserver://localhost/sonarqube;SelectMethod=Cursor"

# Add env URLs for SQ
set -x PENV "-Dsonar.jdbc.url=$P_JDBC_URL -Dsonar.jdbc.driverClassName=org.postgresql.Driver -Dsonar.host.url=http://localhost:9000"
set -x MENV "-Dsonar.jdbc.url=$M_JDBC_URL -Dsonar.jdbc.driverClassName=com.mysql.jdbc.Driver -Dsonar.host.url=http://localhost:9000"
set -x OENV "-Dsonar.jdbc.url=$O_JDBC_URL -Dsonar.jdbc.driverClassName=oracle.jdbc.OracleDriver -Dsonar.host.url=http://localhost:9000"
set -x HENV "-Dsonar.jdbc.url=$H_JDBC_URL -Dsonar.jdbc.driverClassName=org.h2.Driver -Dsonar.host.url=http://localhost:9000"
set -x MSENV "-Dsonar.jdbc.url=$MS_JDBC_URL -Dsonar.jdbc.driverClassName=net.sourceforge.jtds.jdbc.Driver -Dsonar.host.url=http://localhost:9000"


# ================================
# Env variables & Aliases to our test with our VMs
# ================================
set -x VMS_REPO $HOME/VMs
# For Dory VM
set -x NO_SONARQUBE 1


# ================================
# Aliases specific to GitHub repositories and associated tests
# ================================
set -x TESTS $HOME/Tests

function fake-project
    cd $TESTS/Java/projects/fake-project-for-tests
end
function multi-module-project
    cd $TESTS/Java/projects/multi-module-project
end
function multi-language-project
    cd $TESTS/Multi-language/multi-language-test
end
