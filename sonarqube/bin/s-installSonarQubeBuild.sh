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
	echo "Install build of SonarQube $1 $2"
	VERSION=$1

	if [[ "$2" = "dev" ]]
	then
		# Developer Edition
		URL="https://$REPOX_USER:$REPOX_PASS@repox.sonarsource.com/sonarsource/com/sonarsource/sonarqube/sonarqube-developer/$VERSION/sonarqube-developer-$VERSION.zip"

		HTTP_CODE=$(curl --write-out '%{http_code}' --silent --output /dev/null --head "$URL")
		if [ ! "$HTTP_CODE" = "200" ]
		then
			echo "Can't find ZIP file for build $VERSION"
			exit 1
		fi
	else
		# Community Edition by default
		URL="https://repox.sonarsource.com/sonarsource/org/sonarsource/sonarqube/sonar-application/$VERSION/sonar-application-$VERSION.zip"

		HTTP_CODE=$(curl --write-out '%{http_code}' --silent --output /dev/null --head "$URL")
		if [ ! "$HTTP_CODE" = "200" ]
		then
			# Maybe it's just a dev version
			URL="https://$REPOX_USER:$REPOX_PASS@repox.sonarsource.com/sonarsource-dev/org/sonarsource/sonarqube/sonar-application/$VERSION/sonar-application-$VERSION.zip"

			HTTP_CODE=$(curl --write-out '%{http_code}' --silent --output /dev/null --head "$URL")
			if [ ! "$HTTP_CODE" = "200" ]
			then
				echo "Can't find ZIP file for build $VERSION"
				exit 1
			fi
		fi
	fi
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

# Set fake URL for telemetry to be sure to not pollute Chestnut
echo "sonar.telemetry.url=http://xavier.gva.sonarsource.com:9876/sonarqube" >> $SONAR_NEXT/conf/sonar.properties

# And start SonarQube
echo "================================================="
sq.sh start
echo ""

if [[ "$OSTYPE" =~ ^darwin ]]
then
	# notification on OSX
	osascript -e 'display notification "SonarQube starting..." with title "SonarQube"'
fi
