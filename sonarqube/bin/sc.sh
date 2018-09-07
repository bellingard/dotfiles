#!/bin/sh

# Exit on failure
set -e

clearDBSettings() {
  sed '/embeddedDatabase/d' $SONAR_PROPERTIES_FILE > $SONAR_PROPERTIES_FILE.new
  sed '/jdbc.url/d' $SONAR_PROPERTIES_FILE.new > $SONAR_PROPERTIES_FILE
  rm $SONAR_PROPERTIES_FILE.new
}

clearDataFolder() {
  rm -rf $SONAR_CURRENT/data/*
  rm -rf $SONAR_CURRENT/logs/*
}

SONAR_PROPERTIES_FILE=$SONAR_CURRENT/conf/sonar.properties
SONAR_DB="localhost"

if [ "$1" = "start" ]
then
  # clean the temp data
  clearDataFolder

  # Clear DB settings
  clearDBSettings

  # print out properties for the correct DB
  if [ "$2" = "P" ]
  then
    echo "sonar.jdbc.url=jdbc:postgresql://localhost:5432/sonarqube" >> $SONAR_PROPERTIES_FILE
  else
    echo "sonar.jdbc.url=jdbc:h2:tcp://localhost:9092/sonar" >> $SONAR_PROPERTIES_FILE
    echo "sonar.embeddedDatabase.port=9092" >> $SONAR_PROPERTIES_FILE
  fi
fi

$SONAR_CURRENT/bin/$SONAR_WRAPPER_FOLDER/sonar.sh $1
