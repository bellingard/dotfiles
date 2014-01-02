#!/bin/sh

SONAR_PROPERTIES_FILE=$SOFTWARE_FOLDER/Sonar/current/conf/sonar.properties

if [ "$1" = "start" ]
then 
  # print out properties for the correct DB
  if [ "$2" = "P" ] 
  then
    echo "sonar.jdbc.url=jdbc:postgresql://localhost:15432/sonar" >> $SONAR_PROPERTIES_FILE
  else
    if [ "$2" = "M" ] 
    then
      echo "sonar.jdbc.url=jdbc:mysql://localhost:13306/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true" >> $SONAR_PROPERTIES_FILE
    else
      if [ "$2" = "O" ] 
      then
        echo "sonar.jdbc.url=jdbc:oracle:thin:@localhost/XE" >> $SONAR_PROPERTIES_FILE
      else
        echo "sonar.jdbc.url=jdbc:h2:tcp://localhost:9092/sonar" >> $SONAR_PROPERTIES_FILE
      fi
    fi
  fi
fi

$SOFTWARE_FOLDER/Sonar/current/bin/$SONAR_WRAPPER_FOLDER/sonar.sh $1
