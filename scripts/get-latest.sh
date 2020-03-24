#!/usr/bin/env bash
set -e

# pass in --version-only as first arg to not download
# will come back to this and make it less lazy

#ACCOUNT_PATH='/opt/app'
echo "ACCOUNT_PATH = ${ACCOUNT_PATH}"

LATEST="https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest-4.3/release.txt"

LATEST_VERSION=`curl -s ${LATEST} | grep Version: | sed 's/ *Version: *//g'`

if [[ $1 == "--version-only" ]]; then
    echo "${LATEST_VERSION}"
fi

echo $LATEST_VERSION > latest-version.txt
echo $LATEST_VERSION > ${ACCOUNT_PATH}/test

# Get current version
CURRENT_VERSION=`~/bin/openshift-install version | head -n 1 | awk '{print $2}' | sed 's/ *v *//g'`

if [[ $1 == "--version-only" ]]; then
    echo "${CURRENT_VERSION}"
fi

echo $CURRENT_VERSION > current-version.txt

if [[ ${CURRENT_VERSION} != ${LATEST_VERSION} ]]; then
    echo "Newer version found, deploy required" && touch ${ACCOUNT_PATH}/continue;
else
    echo "Matching versions, no changes required" && touch ${ACCOUNT_PATH}/stop;
fi