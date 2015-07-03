#!/bin/bash

set -e

plugins=`ls old_bundle`
for plugin in $plugins
do
  echo "Processing $plugin..."
  remote=`cd old_bundle/$plugin && git config remote.origin.url`

  git submodule add $remote .vim/bundle/$plugin
  git commit -m "Added $plugin"
done
