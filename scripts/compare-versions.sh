#!/bin/bash

# /opt/temp/
echo "SOME TEXT opt temp" > /opt/temp/testing-temp.txt

# /var/lib/buildkite-agent/builds/ip-10-10-0-9-eu-west-2-compute-internal-1/musketeers/testing-musketeers/
echo "some text" > testing-working-dir.txt

echo "ACCOUNT_PATH = ${ACCOUNT_PATH}"

LATEST="https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest-4.3/release.txt"

LATEST_VERSION=`curl -s ${LATEST} | grep Version: | sed 's/ *Version: *//g'`

echo $LATEST_VERSION > /opt/temp/latest-version.txt

# # Get current version
# #CURRENT_VERSION=`/opt/app/openshift-install version | head -n 1 | awk '{print $2}' | sed 's/ *v *//g'`


# echo $CURRENT_VERSION > current-version.txt

# if [[ ${CURRENT_VERSION} != ${LATEST_VERSION} ]]; then
#     echo "Newer version found, deploy required" && touch ${ACCOUNT_PATH}/continue;
# else
#     echo "Matching versions, no changes required" && touch ${ACCOUNT_PATH}/stop;
# fi