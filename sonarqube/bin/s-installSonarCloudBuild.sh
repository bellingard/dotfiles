#!/bin/sh

# Exit on failure
set -e

if [[ "$1" = "" ]]
then
	echo "Install latest stable build of SonarCloud"
	LATEST=$(curl --silent "https://$BURGRX_USER:$BURGRX_PASS@burgrx.sonarsource.com/api/commitPipelinesStages?project=SonarSource/sonar-enterprise&branch=master&nbOfCommits=50" | jq '[.[].pipelines[] | select(.stages[].type == "promotion")] | .[0]')
	if [ "$LATEST" = "null" ]
	then
			echo "No latest stable build."
			exit 1
	fi

	VERSION=$(echo $LATEST | jq -r '.version')
	URL="https://$REPOX_USER:$REPOX_PASS@repox.sonarsource.com/sonarsource/com/sonarsource/sonarqube/sonarcloud/$VERSION/sonarcloud-$VERSION.zip"
else
	echo "Install build of SonarCloud $1"
	VERSION=$1
	URL="https://$REPOX_USER:$REPOX_PASS@repox.sonarsource.com/sonarsource/com/sonarsource/sonarqube/sonarcloud/$VERSION/sonarcloud-$VERSION.zip"

	HTTP_CODE=$(curl --write-out '%{http_code}' --silent --output /dev/null --head "$URL")
	if [ ! "$HTTP_CODE" = "200" ]
	then
		# Maybe it's just a dev version
		URL="https://$REPOX_USER:$REPOX_PASS@repox.sonarsource.com/sonarsource-dev/com/sonarsource/sonarqube/sonarcloud/$VERSION/sonarcloud-$VERSION.zip"

		HTTP_CODE=$(curl --write-out '%{http_code}' --silent --output /dev/null --head "$URL")
		if [ ! "$HTTP_CODE" = "200" ]
		then
			echo "Can't find ZIP file for build $VERSION"
			exit 1
		fi
	fi
fi

echo "Downloading SonarCloud $VERSION"
curl -L -# -o "$SOFTWARE_FOLDER/SonarQube/_TEMP_/sonarcloud-$VERSION.zip" "$URL"

echo "Extracting it"
rm -rf $SONAR_NEXT_FILES/INSTALL/*
unzip -q $SOFTWARE_FOLDER/SonarQube/_TEMP_/sonarcloud-$VERSION.zip -d $SONAR_NEXT_FILES/INSTALL

echo "Recreate the symlinks"
rm $SONAR_NEXT
ln -s $SONAR_NEXT_FILES/INSTALL/sonarqube-$VERSION $SONAR_NEXT
rm $SONAR_CURRENT
ln -s $SONAR_NEXT_FILES/INSTALL/sonarqube-$VERSION $SONAR_CURRENT

echo "Clean up temp file"
rm $SOFTWARE_FOLDER/SonarQube/_TEMP_/sonarcloud-$VERSION.zip

# Set fake Muppet settings
echo "muppet.secret.token=fake" >> $SONAR_NEXT/conf/sonar.properties
# Set fake URL for telemetry to be sure to not pollute Chestnut
echo "sonar.telemetry.url=http://xavier.gva.sonarsource.com:9876/sonarqube" >> $SONAR_NEXT/conf/sonar.properties

# And start SonarCloud
echo "================================================="
s-sonar.sh start
echo ""

if [[ "$OSTYPE" =~ ^darwin ]]
then
	# notification on OSX
	osascript -e 'display notification "SonarCloud starting..." with title "SonarCloud"'
fi
