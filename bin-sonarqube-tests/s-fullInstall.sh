#!/bin/sh

# Exit on failure
set -e

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
s-getLatestVersion.sh
echo ""

# Unzip it
echo "================================================="
s-unzipDistrib.sh
echo ""

# Restore backup plugins
echo "================================================="
s-restorePlugins.sh
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
