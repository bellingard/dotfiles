#!/bin/sh

# Exit on failure
set -e

setDefaultCredentials() {
    echo "sonar.jdbc.username=sonarqube" >> $SONAR_PROPERTIES_FILE
    echo "sonar.jdbc.password=sonarqube" >> $SONAR_PROPERTIES_FILE
}

clearEmbeddedDatabaseSettings() {
  sed '/embeddedDatabase/d' $SONAR_PROPERTIES_FILE > $SONAR_PROPERTIES_FILE.new
  sed '/jdbc/d' $SONAR_PROPERTIES_FILE.new > $SONAR_PROPERTIES_FILE
  rm $SONAR_PROPERTIES_FILE.new
}

clearDataFolder() {
  rm -rf $SONAR_CURRENT/data/*
  rm -rf $SONAR_CURRENT/logs/*
}

SONAR_PROPERTIES_FILE=$SONAR_CURRENT/conf/sonar.properties
SONAR_DB="localhost"

# Always set fake URL for telemetry to be sure to not pollute Chestnut
echo "sonar.telemetry.url=http://xavier.gva.sonarsource.com:9876/sonarqube" >> $SONAR_PROPERTIES_FILE

if [ "$1" = "start" ]
then
  # clean the temp data
  clearDataFolder

  # Clear DB settings
  clearEmbeddedDatabaseSettings

  # print out properties for the correct DB
  if [ "$2" = "P" ]
  then
    setDefaultCredentials
    echo "sonar.jdbc.url=$P_JDBC_URL" >> $SONAR_PROPERTIES_FILE
  else
    if [ "$2" = "M" ]
    then
      setDefaultCredentials
      echo "sonar.jdbc.url=$M_JDBC_URL" >> $SONAR_PROPERTIES_FILE
    else
      if [ "$2" = "O" ]
      then
        # copy the driver if it does not exist
        ORACLE_DRIVER="$SONAR_NEXT/extensions/jdbc-driver/oracle/ojdbc6-11.2.0.3.0.jar"
        if [ ! -f "$ORACLE_DRIVER" ]
        then
          echo "Copying ORACLE driver"
          cp $SOFTWARE_FOLDER/SonarQube/ojdbc6-11.2.0.3.0.jar $SONAR_CURRENT/extensions/jdbc-driver/oracle/
        fi

        setDefaultCredentials
        echo "sonar.jdbc.url=$O_JDBC_URL" >> $SONAR_PROPERTIES_FILE
      else
        if [ "$2" = "MS" ]
        then
          setDefaultCredentials
          echo "sonar.jdbc.url=$MS_JDBC_URL" >> $SONAR_PROPERTIES_FILE
        else
          echo "sonar.jdbc.url=$H_JDBC_URL" >> $SONAR_PROPERTIES_FILE
          echo "sonar.embeddedDatabase.port=9092" >> $SONAR_PROPERTIES_FILE
        fi
      fi
    fi
  fi
fi

$SONAR_CURRENT/bin/$SONAR_WRAPPER_FOLDER/sonar.sh $1
