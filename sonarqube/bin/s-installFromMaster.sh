#!/bin/sh

# Exit on failure
set -e

unzipDistrib() {
	sonarVersion=`ls $REPOS/sonar/sonar-application/target/sonarqube-*-SNAPSHOT.zip | sed 's/.*target\/sonarqube-\(.*\)-SNAPSHOT\.zip/\1/' `
	echo "Extracting SonarQube $sonarVersion"

	rm -rf $SONAR_NEXT_FILES/INSTALL/*
	unzip -q $REPOS/sonar/sonar-application/target/sonarqube-$sonarVersion-SNAPSHOT.zip -d $SONAR_NEXT_FILES/INSTALL
	mv $SONAR_NEXT_FILES/INSTALL/sonarqube-$sonarVersion-SNAPSHOT/lib/bundled-plugins/*.jar $SONAR_NEXT_FILES/INSTALL/sonarqube-$sonarVersion-SNAPSHOT/extensions/plugins/
	echo "Distribution unzipped"

	rm $SONAR_NEXT
	ln -s $SONAR_NEXT_FILES/INSTALL/sonarqube-$sonarVersion-SNAPSHOT $SONAR_NEXT
	rm $SONAR_CURRENT
	ln -s $SONAR_NEXT_FILES/INSTALL/sonarqube-$sonarVersion-SNAPSHOT $SONAR_CURRENT

	# Add DB credentials because they're no more set by default
	echo "\n\nsonar.jdbc.username=sonar" >> $SONAR_NEXT/conf/sonar.properties
	echo "\nsonar.jdbc.password=sonar" >> $SONAR_NEXT/conf/sonar.properties

	# Configure Dev UPC
	echo "\n\nsonar.updatecenter.url=http://update.sonarsource.org/update-center-dev.properties" >> $SONAR_NEXT/conf/sonar.properties
	# Enable E/S HTTP port
	echo "\nsonar.search.httpPort=9010" >> $SONAR_NEXT/conf/sonar.properties

	echo "Distribution installed"
}


echo "Full install of SonarQube and plugins"

# Check if build is required for plugins and if specific DB is specified for the startup
for var in "$@"
do
	if [ "$var" = "-o" ]
	then
		PLUGIN_BUILD_OPTION="-o"
		echo "  => No build required for plugins"
	elif [ "$var" = "P" ] || [ "$var" = "M" ] || [ "$var" = "O" ]
	then
		DB_FOR_STARTUP="$var"
		echo "  => DB selected for startup: $DB_FOR_STARTUP"
	fi
done
echo ""

# Get and build latest version of SQ
echo "================================================="
currentDir=$PWD
cd $REPOS/sonar
git pull
./quick-build.sh
cd $currentDir
echo ""

# Unzip it
echo "================================================="
unzipDistrib
echo ""

# Restore backup plugins
echo "================================================="
cp $SONAR_NEXT_FILES/BACKUP/*.jar $SONAR_NEXT/extensions/plugins/ 2>/dev/null || :
echo ""

# Checks if plugins must be installed or not
for var in "$@"
do
	if [ "$var" != "-o" ] && [ "$var" != "P" ] && [ "$var" != "M" ] && [ "$var" != "O" ]
	then
		echo "================================================="
		s-installLatestVersionOfPlugin.sh $var $PLUGIN_BUILD_OPTION
		echo ""
	fi
done

# And start SonarQube
echo "================================================="
s-sonar.sh start $DB_FOR_STARTUP
echo ""

if [[ "$OSTYPE" =~ ^darwin ]]
then
	# notification on OSX
	osascript -e 'display notification "SonarQube starting..." with title "SonarQube"'
fi
