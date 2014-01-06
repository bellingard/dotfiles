#!/bin/sh
sonarVersion=`ls $REPOS/sonar/sonar-application/target/sonarqube-*-SNAPSHOT.zip | sed 's/.*target\/sonarqube-\(.*\)-SNAPSHOT\.zip/\1/' `
Echo "Extracting SonarQube $sonarVersion"

rm -rf $SONAR_TESTS/INSTALL/*
unzip -q $REPOS/sonar/sonar-application/target/sonarqube-$sonarVersion-SNAPSHOT.zip -d $SONAR_TESTS/INSTALL
mv $SONAR_TESTS/INSTALL/sonarqube-$sonarVersion-SNAPSHOT/lib/bundled-plugins/*.jar $SONAR_TESTS/INSTALL/sonarqube-$sonarVersion-SNAPSHOT/extensions/plugins/
echo "Distribution unzipped"

rm $SONAR_TESTS/sonar-current
ln -s $SONAR_TESTS/INSTALL/sonarqube-$sonarVersion-SNAPSHOT $SONAR_TESTS/sonar-current
echo "sonar.updatecenter.url=http://update.sonarsource.org/update-center-dev.properties" >> $SONAR_TESTS/sonar-current/conf/sonar.properties
echo "Distribution installed"
