#!/bin/sh
sonarVersion=`ls $REPOS/sonar/sonar-application/target/sonarqube-*-SNAPSHOT.zip | sed 's/.*target\/sonarqube-\(.*\)-SNAPSHOT\.zip/\1/' `
echo "Extracting SonarQube $sonarVersion"

rm -rf $SONAR_TESTS/INSTALL/*
unzip -q $REPOS/sonar/sonar-application/target/sonarqube-$sonarVersion-SNAPSHOT.zip -d $SONAR_TESTS/INSTALL
mv $SONAR_TESTS/INSTALL/sonarqube-$sonarVersion-SNAPSHOT/lib/bundled-plugins/*.jar $SONAR_TESTS/INSTALL/sonarqube-$sonarVersion-SNAPSHOT/extensions/plugins/
echo "Distribution unzipped"

rm $SONAR_TESTS/sonar-current
ln -s $SONAR_TESTS/INSTALL/sonarqube-$sonarVersion-SNAPSHOT $SONAR_TESTS/sonar-current

# Configure Dev UPC
echo "\n\nsonar.updatecenter.url=http://update.sonarsource.org/update-center-dev.properties" >> $SONAR_TESTS/sonar-current/conf/sonar.properties
# Enable E/S HTTP port
echo "\nsonar.search.httpPort=9010" >> $SONAR_TESTS/sonar-current/conf/sonar.properties

echo "Distribution installed"
