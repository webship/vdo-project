#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Lightning                                   |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/lightning          |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev composer create-project acquia/lightning-project lightning --no-interaction ;


