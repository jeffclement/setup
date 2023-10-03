#!/bin/bash

BRANCH_NAME=$1

echo "BRANCH_NAME=${BRANCH_NAME}"

set -x
git branch -d ${BRANCH_NAME}
git push origin --delete ${BRANCH_NAME}
{ set +x; } 2>/dev/null
