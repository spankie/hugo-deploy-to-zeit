#!/bin/bash

set -e
set -o pipefail

if [[ -z "$HUGO_VERSION" ]]; then
	HUGO_VERSION=0.59.1
  echo 'No HUGO_VERSION was set, so defaulting to '$HUGO_VERSION
fi

if [[ -z "$ZEIT_TOKEN" ]]; then
  echo 'No ZEIT_TOKEN was set'
  exit 1
fi

echo 'Downloading hugo'
curl -sSL https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz > /tmp/hugo.tar.gz && tar -f /tmp/hugo.tar.gz -xz

echo 'Building the hugo site'
./hugo
echo 'Hugo finished building'

echo 'Deploying to Zeit'
npm i -g now
cd public
now --prod --token "$ZEIT_TOKEN"
echo 'Complete'
