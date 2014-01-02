#!/bin/sh

# Need to have $SONARSOURCE_PLUGIN_LICENSES_URL defined as environment variable

setLicense() {
  LICENSE=`curl -s $SONARSOURCE_PLUGIN_LICENSES_URL/$1.txt | tr -d '\r\n'`
  curl -s -u admin:admin -X POST "http://localhost:9000/api/properties?id=$1.license.secured&value=$LICENSE"
}

setLicense "views"
setLicense "sqale"
setLicense "devcockpit"
setLicense "report"
