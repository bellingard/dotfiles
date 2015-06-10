#!/bin/sh

if [ "$1" = "" ] 
then
  CURRENT=$SONAR_NEXT
  echo "SonarQube SNAPSHOT configured as current installation."
else
  if [ -d $SOFTWARE_FOLDER/SonarQube/sonarqube-$1 ] 
  then
    CURRENT=$SOFTWARE_FOLDER/SonarQube/sonarqube-$1
    echo "SonarQube $1 configured as current installation."
  elif [ -d $SOFTWARE_FOLDER/SonarQube/sonar-$1 ] 
  then
  	CURRENT=$SOFTWARE_FOLDER/SonarQube/sonar-$1
  	echo "Sonar $1 configured as current installation."
  else
  	echo "No SQ install folder found for version $1"
  	echo "Current version is unchanged"
  fi
fi

if [ "$CURRENT" != "" ]
then
	rm $SONAR_CURRENT
	ln -s $CURRENT $SONAR_CURRENT
fi
