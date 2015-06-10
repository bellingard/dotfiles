#!/bin/sh

# Exit on failure
set -e

PLUGIN=$1
DEPLOY_FOLDER=$PLUGINS_DEV

echo "Building SonarQube $1"

if [ "$2" = "-o" ]
then
  echo "(no build required)"
else
  cd $REPOS/sonar-$PLUGIN
  git pull
  mvn clean install -DskipTests
fi
echo ""

installPluginInDeployFolder() {
  if [ "$2" = "" ]
  then 
    # Simple plugin
    NAME=$1
    BINARY="$REPOS/sonar-$PLUGIN/target/sonar-$PLUGIN-plugin-*-SNAPSHOT.jar"
  else
  	# Multi-JAR plugin
    NAME=$2
  	BINARY="$REPOS/sonar-$PLUGIN/sonar-$2-plugin/target/sonar-$2-plugin-*-SNAPSHOT.jar"
  fi
  
  echo "... Installing $NAME"
  rm -f $DEPLOY_FOLDER/sonar-$NAME-plugin-*.jar
  cp $BINARY $DEPLOY_FOLDER
}

PLUGINS_LIST=`ls $REPOS/sonar-$PLUGIN | grep plugin | sed 's/sonar-\(.*\)-plugin/\1/' `

if [ "$PLUGINS_LIST" = "" ]
then
  # Simple plugin
  installPluginInDeployFolder $PLUGIN
else
  # Multi-JAR plugin
  for p in $PLUGINS_LIST; do
    installPluginInDeployFolder $PLUGIN $p
  done
fi

