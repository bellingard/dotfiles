#!/bin/sh

# Dumps all the properties passed by the underlying SonarQube Runner API

mvn $* -DsonarRunner.dumpToFile=target/SQ-dump.txt
