#!/bin/sh
if [ "$1" = "start" ] 
then
osascript <<END 
tell app "Terminal" to do script "tail -f $SOFTWARE_FOLDER/Sonar/current/logs/sonar.log" 
END
	
fi
$SOFTWARE_FOLDER/Sonar/current/bin/macosx-universal-64/sonar.sh $1
