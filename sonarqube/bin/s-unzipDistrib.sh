#!/bin/sh
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
