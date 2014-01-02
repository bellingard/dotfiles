#!/bin/sh
PLUGIN=$1
DEPLOY_FOLDER=$PLUGINS_PROD

echo "Building Plugin $1"

if [ "$2" = "-l" ]
then 
  EXTRA_PATH="sonar-$PLUGIN-plugin/"
  echo "=> LANGUAGE PLUGIN"
fi

cd $REPOS/sonar-$PLUGIN
git pull
mvn clean install -DskipTests

BINARY="$REPOS/sonar-$PLUGIN/$EXTRA_PATH/target/sonar-$PLUGIN-plugin-*-SNAPSHOT.jar"
rm -f $DEPLOY_FOLDER/sonar-$PLUGIN-plugin-*.jar
cp $BINARY $DEPLOY_FOLDER
