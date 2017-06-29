#!/bin/sh

# Exit on failure
set -e

if [[ "$1" = "" ]]
then
	echo "Install latest stable build of SonarQube"
	LATEST=$(curl --silent "https://$BURGRX_USER:$BURGRX_PASS@burgrx.sonarsource.com/api/commitPipelinesStages?project=SonarSource/sonarqube&branch=master&nbOfCommits=50" | jq '[.[].pipelines[] | select(.stages[].type == "promotion")] | .[0]')
	if [ "$LATEST" = "null" ]
	then
			echo "No latest stable build."
			exit 1
	fi

	VERSION=$(echo $LATEST | jq -r '.version')
	URL=$(echo $LATEST | jq -r '.versionUrl')
else
	echo "Install build of SonarQube $1"
	BUILD=$(curl --silent "https://$BURGRX_USER:$BURGRX_PASS@burgrx.sonarsource.com/api/commitPipelinesStages?project=SonarSource/sonarqube&branch=master&nbOfCommits=50" | jq --arg VERSION "$1" '[.[].pipelines[] | select(.stages[].type == "promotion") | select(.version == $VERSION)] | .[0]')
	if [ "$BUILD" = "null" ]
	then
			echo "No stable build for version $1."
			exit 1
	fi

	VERSION=$1
	URL=$(echo $BUILD | jq -r '.versionUrl')
fi

echo "Downloading SonarQube $VERSION"
curl -L -# -o "$SOFTWARE_FOLDER/SonarQube/_TEMP_/sonarqube-$VERSION.zip" "$URL"

echo "Extracting it"
rm -rf $SONAR_NEXT_FILES/INSTALL/*
unzip -q $SOFTWARE_FOLDER/SonarQube/_TEMP_/sonarqube-$VERSION.zip -d $SONAR_NEXT_FILES/INSTALL

echo "Recreate the symlinks"
rm $SONAR_NEXT
ln -s $SONAR_NEXT_FILES/INSTALL/sonarqube-$VERSION $SONAR_NEXT
rm $SONAR_CURRENT
ln -s $SONAR_NEXT_FILES/INSTALL/sonarqube-$VERSION $SONAR_CURRENT

echo "Clean up temp file"
rm $SOFTWARE_FOLDER/SonarQube/_TEMP_/sonarqube-$VERSION.zip

# And start SonarQube
echo "================================================="
s-sonar.sh start
echo ""

if [[ "$OSTYPE" =~ ^darwin ]]
then
	# notification on OSX
	osascript -e 'display notification "SonarQube starting..." with title "SonarQube"'
fi
