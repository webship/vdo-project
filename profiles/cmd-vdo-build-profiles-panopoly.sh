#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Panopoly                                    |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/panopoly           |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev composer create-project panopoly/panopoly-composer-template:9.x-dev panopoly --no-interaction;


