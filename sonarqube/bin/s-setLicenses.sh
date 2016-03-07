#!/bin/sh

setLicense() {
  LICENSE=`more $REPOS/licenses/it/$1.txt | tr -d '\r\n'`
  # double curl because all the plugins do not have the same property...
  curl -s -u admin:admin -X POST "http://localhost:9000/api/properties?id=$1.license.secured&value=$LICENSE"
  curl -s -u admin:admin -X POST "http://localhost:9000/api/properties?id=sonar.$1.license.secured&value=$LICENSE"
}

setLicense "views"
setLicense "sqale"
setLicense "devcockpit"
setLicense "report"
setLicense "governance"

# some language plugins too
setLicense "cpp"

# -----------------------------------------------------------------------------
# OLD WAY TO GET LICENSES
# Need to have $SONARSOURCE_PLUGIN_LICENSES_URL defined as environment variable
setLicenseOLD() {
  LICENSE=`curl -s $SONARSOURCE_PLUGIN_LICENSES_URL/$1.txt | tr -d '\r\n'`
  # double curl because all the plugins do not have the same property...
  curl -s -u admin:admin -X POST "http://localhost:9000/api/properties?id=$1.license.secured&value=$LICENSE"
  curl -s -u admin:admin -X POST "http://localhost:9000/api/properties?id=sonar.$1.license.secured&value=$LICENSE"
}
# -----------------------------------------------------------------------------
