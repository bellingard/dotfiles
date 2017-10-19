#!/bin/sh

# This is a temporary script that will become useless in 5.3+ hopefully

sonar-scanner views -Dsonar.login=admin -Dsonar.password=admin $*
