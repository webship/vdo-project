#!/bin/usr/env bash

echo "*---------------------------------------------------*";
echo "| Build Stratus Meridian Developer Portal           |";
echo "*---------------------------------------------------*";
echo "| https://www.drupal.org/project/sm_dev_portal      |";
echo "*---------------------------------------------------*";

# Bootstrap VDO.
source ${vdo_scripts}/bootstrap.sh || exit 1 ;

# Load workspace settings and extra lists.
eval $(parse_yaml ${vdo_config}/workspace.profiles.settings.yml);

ddev composer create-project stratus-meridian/drupal8-composer-project:8.x-dev sm_dev_portal --no-interaction;


