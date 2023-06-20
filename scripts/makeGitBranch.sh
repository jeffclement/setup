#!/bin/bash

BRANCH_NAME=$1

echo "BRANCH_NAME=${BRANCH_NAME}"

set -x
git checkout -b ${BRANCH_NAME}
git push -u origin ${BRANCH_NAME}
{ set +x; } 2>/dev/null
