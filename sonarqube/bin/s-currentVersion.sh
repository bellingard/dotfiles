#!/bin/sh
sonarVersion=`ls -l $SOFTWARE_FOLDER/SonarQube/current | sed 's/.*>.*-\([0-9].*\)/\1/' `
echo "Current version => $sonarVersion"
