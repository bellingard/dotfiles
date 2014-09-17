#!/bin/sh

# Exit on failure
set -e

SONAR_PROPERTIES_FILE=$SONAR_TESTS/sonar-current/conf/sonar.properties

if [ -z "$3" ]
then 
  SONAR_DB="localhost"
else
  SONAR_DB="$3"
fi

if [ "$1" = "start" ]
then 
  # clean the temp data
  s-clearDataFolder.sh

  # print out properties for the correct DB
  if [ "$2" = "P" ] 
  then
    echo "sonar.jdbc.url=jdbc:postgresql://$SONAR_DB:15432/sonar" >> $SONAR_PROPERTIES_FILE
  else
    if [ "$2" = "M" ] 
    then
      echo "sonar.jdbc.url=jdbc:mysql://$SONAR_DB:13306/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&useConfigs=maxPerformance&useCursorFetch=true" >> $SONAR_PROPERTIES_FILE
    else
      if [ "$2" = "O" ] 
      then
        # copy the driver if it does not exist
        ORACLE_DRIVER="$SONAR_TESTS/sonar-current/extensions/jdbc-driver/oracle/ojdbc6-11.2.0.3.0.jar"
        if [ ! -f "$ORACLE_DRIVER" ]
        then
          echo "Copying ORACLE driver"
          cp $SOFTWARE_FOLDER/Sonar/ojdbc6-11.2.0.3.0.jar $SONAR_TESTS/sonar-current/extensions/jdbc-driver/oracle/
        fi

        echo "sonar.jdbc.url=jdbc:oracle:thin:@$SONAR_DB:11521/ORCL" >> $SONAR_PROPERTIES_FILE
      else
        if [ "$2" = "MS" ] 
        then
          echo "sonar.jdbc.url=jdbc:jtds:sqlserver://$SONAR_DB/sonar;SelectMethod=Cursor" >> $SONAR_PROPERTIES_FILE
        else
          echo "sonar.jdbc.url=jdbc:h2:tcp://$SONAR_DB:9092/sonar" >> $SONAR_PROPERTIES_FILE
        fi
      fi
    fi
  fi
fi

$SONAR_TESTS/sonar-current/bin/$SONAR_WRAPPER_FOLDER/sonar.sh $1
