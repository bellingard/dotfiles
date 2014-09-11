#!/bin/sh

rm $SOFTWARE_FOLDER/Maven/current

if [ "$1" = "2" ] 
then
  ln -s $SOFTWARE_FOLDER/Maven/apache-maven-2.2.1/ $SOFTWARE_FOLDER/Maven/current
else
  if [ "$1" = "3.0" ] 
  then
    ln -s $SOFTWARE_FOLDER/Maven/apache-maven-3.0.5/ $SOFTWARE_FOLDER/Maven/current
  else
  	ln -s $SOFTWARE_FOLDER/Maven/apache-maven-3.2.1/ $SOFTWARE_FOLDER/Maven/current
  fi
fi

mvn -v
