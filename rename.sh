#!/bin/bash

set -e

if [[ $# != 1 ]]; then
    echo syntax: $0 newname
    exit 1
fi

newname=$1
sed -i -e "s/^Source:.*/Source: $newname/; \
           s/^Package:.*/Package: $newname/; \
           s/^Maintainer:.*/Maintainer: $GIT_AUTHOR_NAME <$GIT_AUTHOR_EMAIL>/" example/debian/control

mv example/example.py example/$newname.py
