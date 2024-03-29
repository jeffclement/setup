#!/bin/bash

# This script recursively changes all of the versions of a git repository

NEW_VERSION=$1
echo "NEW_VERSION=${NEW_VERSION}"

set -x
mvn versions:set -DgroupId=* -DartifactId=* -DoldVersion=* -DnewVersion=${NEW_VERSION} -DgenerateBackupPoms=false
{ set +x; } 2>/dev/null
