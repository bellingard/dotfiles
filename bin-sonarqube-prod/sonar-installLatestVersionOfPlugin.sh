#!/bin/sh
PLUGIN=$1

cd $REPOS/sonar-$PLUGIN
git pull
mvn clean install -DskipTests

rm -f $PLUGINS_PROD/sonar-$PLUGIN-plugin-*.jar
cp $REPOS/sonar-$PLUGIN/target/sonar-$PLUGIN-plugin-*-SNAPSHOT.jar $PLUGINS_PROD
